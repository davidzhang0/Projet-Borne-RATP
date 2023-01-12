GCC= C:/MinGW/bin/gcc
CUNIT = C:/CUnit-2.1-3/CUnit/
SRC= controller
TEST= controller_test


CUnitAutomated-Results.xml : $(TEST).exe
	./$(TEST).exe
	rm -f *.o *.exe

$(SRC).o : $(SRC).c
	$(GCC) -Wall -c $(SRC).c -o $(SRC).o

$(TEST).exe : $(TEST).c $(SRC).o 
	$(GCC) -Wall -L$(CUNIT)Sources/.libs -I$(CUNIT)Headers -o $(TEST) $(TEST).c $(SRC).o -lcunit

clean :
	rm -f *.o *.exe *.xml  