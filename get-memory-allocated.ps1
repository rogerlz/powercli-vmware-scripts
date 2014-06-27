#
# Very simple script in VMware PowerCLI to get amount of memory allocated of VMs by Host
# Author = Rogerio Goncalves <rogerlz@gmail.com>
# http://vchallenge.me
#

Get-VMhost | Select Name,@{N="Memory Allocated GB";E={$_ | Get-VM | %{($_.MemoryMB / 1KB) -as [int]} | Measure-Object -Sum | Select -ExpandProperty Sum}}
