./server.sh
./clock.sh
while true
do
	./ethminer -U -P stratum+ssl://0x4A6944369Cac57436203c9651201b5C1FA63A754.paul_pc@us1.ethermine.org:5555 -v 2 --exit
	sleep 5m
done
