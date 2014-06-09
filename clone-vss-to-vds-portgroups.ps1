#
# Very simple script in VMware PowerCLI to clone VSS PortGroups to DVS Switch
# Author = Rogerio Goncalves <rogerlz@gmail.com
# http://vchallenge.me
#

$srcHost = "esxhost01.labexample.com"
$vssName = "vSwitch1"
$dvsName = "dvSwitch01"
$dvPgPorts = 128
$dvPgPrefix = "dvPortGroup-"

$getHost = Get-VMHost $srcHost
$getVss = $getHost | Get-VirtualSwitch -Name $vssName
$getVssPgs = $getVss | Get-VirtualPortGroup
$getDvs = Get-VDSwitch $dvsName

foreach ($pg in $getVssPgs) {
	$dvPgName = $dvPgPrefix + $pg.name.ToString()
    	Get-VDSwitch -Name $getDvs | New-VDPortGroup -Name $dvPgName -VLanId $pg.VLANID -PortBinding "Static" -NumPorts $dvPgPorts
}
