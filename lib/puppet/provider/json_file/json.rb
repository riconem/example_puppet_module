require 'json'

Puppet::Type.type(:json_file).provide :json do

    def exists?
        @dir = resource[:dir]
        Dir.mkdir(@dir) unless File.exists?(@dir)
        file_name = resource[:name] + '.json'
        @file_path = File.join(@dir, file_name)
        @data = resource[:data]
        if File.exists?(@file_path)
            old_data = JSON.parse(File.read(@file_path))
            return true if old_data == @data
        end
        return false
    end

    def update
        return false unless File.exists?(@file_path)
        File.open(@file_path, "w") do |f|
            f.puts JSON.pretty_generate(@data)
        end
        Puppet.notice("Update #{@file_path}.")
        return true
    end

    def create
        return true if update
        File.open(@file_path, "w") do |f|
            f.puts JSON.pretty_generate(@data)
        end
        Puppet.notice("Creating #{@file_path} with the following data:")
        Puppet.notice(@data)
    end

    def destroy
        File.delete(@file_path)
        Puppet.notice("Deleting #{@file_path}.")
    end
  
    def print_data
        if File.exists?(@file_path)
            data = JSON.parse(File.read(@file_path))
            Puppet.notice("Data in #{@file_path}:")
            Puppet.notice(data)
        else
            Puppet.notice("Can't find #{@file_path}!")
        end
    end
end