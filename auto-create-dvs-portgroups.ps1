#
# Very simple script in VMware PowerCLI to auto create DVS portgroups using same prefix
# Author = Rogerio Goncalves <rogerlz@gmail.com>
# http://vchallenge.me
#
# Ps: this example is using the range 600-800 of vlans. 

$dvsname = "DvsExample01"
$pgprefix = "dvPG_Example_"
$pgnumports = 128

foreach ($vlan in 600..800) {
	Write-Output "---- Creating VLAN $vlan"
	$pgname = $pgprefix + $vlan
	Get-VDSwitch -Name $dvsname | New-VDPortGroup -Name $pgname -VLanId $vlan -PortBinding "Static" -NumPorts $pgnumports
}
