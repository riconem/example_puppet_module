# To test with self_refresh: true if refresh works as expected
# By change to Puppet::Type.newtype(:json_file, self_refresh: true) do

Puppet::Type.newtype(:json_file) do
    desc 'This is a example of a custom resource in Puppet that creates json data under :dir'

    ensurable do
        defaultvalues

        newvalue(:print_data) do
            provider.print_data
        end
    end

    newparam(:name, namevar: true) do
        desc 'json file name'
    end

    newparam(:data) do
        desc 'json file data'
        validate do |value|
            raise('Inserted value for data is not valid') unless value.class == Hash
        end
    end

    newparam(:dir) do
        desc 'json file resource directory'
        validate do |value|
            raise('Inserted value for dir is not valid') unless value.class == String
        end
    end

    def refresh
        provider.print_data
    end
end
