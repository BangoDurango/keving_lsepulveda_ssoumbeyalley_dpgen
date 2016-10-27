#include <iostream>
#include <string>
#include <sstream>
#include <cstdlib>
#include <fstream>
#include "Parser.h"
#include "V_Module.h"
#include "V_Pin.h"

using namespace std;

int main (int argc, char* argv[]){
	//std::cout << "Test" << endl;	
	string ins;
	string inp;
	string in;
	char* inc;
	string outp;
	string outs;
	string out;
	char* outc;
	inp = "C:\\Users\\Kevin\\Documents\\GitHub\\keving_lsepulveda_ssoumbeyalley_dpgen\\circuits\\";
		ins = "474a_circuit5.txt";
		in = inp + ins;
		inc = new char [in.length() - 1];
		strcpy(inc, in.c_str());

	outp = "C:\\Users\\Kevin\\Documents\\GitHub\\keving_lsepulveda_ssoumbeyalley_dpgen\\circuits\\output\\";
		outs = "474a_circuit5.v";
		out = outp + outs;
		outc = new char[out.length() - 1];
		strcpy(outc, out.c_str());

	if (argc != 3) {
		std::cout << "incorrect number of arguments." << std::endl;
		exit(1);
		//return 0;
	}

	//std::cout << argv[0] << std::endl;
	V_Module vmod;

	Parser::parseFile(inc, vmod.getFileStringVector());
	//static parser class reads each line of the file in to vmod member rawfilestrings
	string dName = Parser::getModuleName(inc);
//	vmod.debugName = dName;

	vmod.generatePins();
	
	vmod.generateComponents();
	//vmod.printLines();
	vmod.generateVerilogFile(outc);


	return 0;
}