# Websphere Vagrand Dev Box

A Websphere 8.0.0 vagrant box.

## How to use
  1. Create a IBMid account [here](https://www.ibm.com/account/us-en/)
  2. Download external resources. See [External Files](external/README.md)
  3. Update [Vagrantfile](Vagrantfile) with your IBMid credentials
  4. ```vagrant up```

## And more

  - Websphere development artifacts installed to local Maven repository. See [was installer pom](was/was.installer-8.0.0.pom).
  - Sample configuration scripts using wsadmin. See [default server config](config/was_config.sh).

## Support for other versions

  Supporting other websphere versions in the near future (maybe).
  It can be done by creating a IBM Installation Manager response file for the desired version, and referencing it on the [Vagrantfile](Vagrantfile):

  ```ruby
      config.vm.provision "shell", name: "was_install", path: "provision/was.sh",
      env: {
        "IBMIM_INPUT_FILE" => "reference_your_response_file_here",
        "IBM_ID" => "IBM_ID",
        "IBM_PASS" => "IBM_PASS",
      }
  ```

  For maven artifacts:
  ```ruby
      config.vm.provision "shell", name: "was_maven", path: "provision/was_maven.sh",
      env: {
        "WAS_INSTALL_DIR" => "/opt/IBM/WebSphere/AppServer",
        "WAS_POM" => "find_and_reference_your_pom_here"
      }
  ```

