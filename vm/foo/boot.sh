export VM_CONFIG_DIR=$HOME/vm
source ./vars.sh
sudo ./qemu-ifup
sudo qemu-system-x86_64 -enable-kvm -m 8192 -cpu host,kvm=off \
-smp 6,sockets=1,cores=3,threads=2 \
-object iothread,id=ith0 \
-drive if=pflash,format=raw,readonly,file=$VM_CONFIG_DIR/OVMF_CODE-pure-efi.fd \
-drive if=pflash,format=raw,file=$VM_CONFIG_DIR/$VM_NAME/OVMF_VARS-pure-efi.fd \
-device nec-usb-xhci,id=xhci \
-drive file=/dev/zvol/zroot/vm-images/$VM_NAME,if=none,id=drive0,cache=none,aio=native,format=raw \
-device virtio-blk-pci,drive=drive0,scsi=off,iothread=ith0 \
-netdev tap,id=$NETDEV,ifname=tap0,script=no,downscript=no -device virtio-net-pci,netdev=$NETDEV \
-daemonize -vga qxl -spice port=5930,disable-ticketing -device virtio-serial-pci -device virtserialport,chardev=spicechannel0,name=com.tomoyat1.spice.0 -chardev spicevmc,id=spicechannel0,name=vdagent \
$@
#sudo ./qemu-ifdown

#-vga none \
#-drive file=/home/tomoyat1/vm/win/winiso.iso,id=isocd,format=raw,if=none -device scsi-cd,drive=isocd \
#-drive file=/home/tomoyat1/vm/win/winvm.img,id=disk,format=qcow2,if=none,cache=writeback -device scsi-hd,drive=disk \
#-net nic -net tap,ifname=tap0,script=no,downscript=no \

#sudo /etc/qemu-ifdown
#-device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1 \

#ELECOM webcam passthrough
#-device usb-host,vendorid=0x056e,productid=0x7016 \

#virtio driver install disk
#-drive file=/home/tomoyat1/vm/win/virt.iso,id=virtiocd,format=raw,if=none -device ide-cd,bus=ide.1,drive=virtiocd \

#windows install disk
#-cdrom ./winiso.iso \

#mouse and keyboard
#-usb -usbdevice host:04b4:120d \
#-usb -usbdevice host:0738:1705 \

#redirection with user networking
#-redir udp:25000::25000 -redir udp:25001::25001 -redir udp:25002::25002 -redir udp:25003::25003 -redir udp:26900::26900 \

#-monitor stdio \
#-soundhw hda \
