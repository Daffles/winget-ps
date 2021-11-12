# TODO: Commands

| Powershell Command                     | Winget Command | Description                                                                                      |
| -------------------------------------- | -------------- | ------------------------------------------------------------------------------------------------ |
| Install-WgPackages                     | install        | Installs the specified application.                                                              |
| Show-WgPackages                        | show           | Displays details for the specified application.                                                  |
|                                        | source         | Adds, removes, and updates the Windows Package Manager repositories accessed by the winget tool. |
| Search-WgPackages                      | search         | Searches for an application.                                                                     |
| Find-InstalledWgPackages               | list           | Display installed packages.                                                                      |
| Update-WgPackages                      | upgrade        | Upgrades the given package.                                                                      |
| Uninstall-WgPackages                   | uninstall      | Uninstalls the given package.                                                                    |
| Get-WgPackageHash                      | hash           | Generates the SHA256 hash for the installer.                                                     |
|                                        | validate       | Validates a manifest file for submission to the Windows Package Manager repository.              |
| Open-WgSettings                        | settings       | Open settings.                                                                                   |
| Show-WgFeatures                        | features       | Shows the status of experimental features.                                                       |
| Export-InstalledWgPackages             | export         | Exports a list of the installed packages.                                                        |
| Install-WgPackages -InputList \<FILE\> | import         | Installs all the packages in a file.                                                             |

# Supported Commands

| Command | Description |
| ------- | ----------- |
