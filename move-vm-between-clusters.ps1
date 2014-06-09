#
# Very simple script using VMware PowerCLI to Move-VM between clusters
# Author = Rogerio Goncalves <rogerlz@gmail.com> 
# http://vchallenge.me
#

$srccluster = "Cluster-Example"
$dstcluster = "Cluster-Destination"

$vms = Get-VM -Location $srccluster
foreach($vm_name in $vms) {
	$vm = Get-VM -name $vm_name
	Move-VM -vm $vm -destination $dstcluster
}
