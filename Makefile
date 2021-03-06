source = $(wildcard *.cpp)
object = $(patsubst %.cpp, %.o, $(source))
CXX=mpic++ 
LIBS=-lboost_filesystem -lboost_system -lboost_mpi -lboost_serialization -lboost_program_options
CXXFLAGS=--std=c++11 -fopenmp -O3

all : main
main : $(object)
	$(CXX) -o $@ $^ $(LDFLAGS) $(LIBS) $(CXXFLAGS) 
%.o : %.cpp %.h
	$(CXX) $(CXXFLAGS) -c -o $@ $< 
clean :
	-rm -rf $(object) main
.PHONY : default clean
