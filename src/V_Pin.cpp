
#include "V_Pin.h"

V_Pin::V_Pin(std::string sName, std::string sType, std::string sBitWidthString) {
	name = sName;
	string bitSubStr;
	//std::cout<< "in pin constructor" << std::endl;

	if (sType == INPUT) type = INPUT;
	else if (sType == OUTPUT) type = OUTPUT;
	else if (sType == WIRE) type = WIRE;
	else if (sType == REGISTER) type = REG;
	else { type = INVALID;
	std::cout << "invalid pin type" << std::endl;
	}

	if (sBitWidthString.substr(0, 4) != "UInt") {
		 bitSubStr = sBitWidthString.substr(3, sBitWidthString.size());
		std::istringstream iss(bitSubStr);
		sgn = false;
		if (!(iss >> bitWidth)) std::cout << "Invalid bit string" << std::endl;
	}
	else {
		bitSubStr = sBitWidthString.substr(4, sBitWidthString.size());
		sgn = true;
		std::istringstream iss(bitSubStr);
		if (!(iss >> bitWidth)) std::cout << "Invalid bit string" << std::endl;
	}
}
V_Pin::V_Pin() {
	//default constructor
	type = "invalid";
}
bool V_Pin::CheckType(std::string sType) {
	//This function verifies that the string is a type input or output etc
	bool flag = false;

	if (sType == INPUT) flag = true;
	else if (sType == OUTPUT) flag = true;
	else if (sType == WIRE) flag = true;
	else if (sType == REGISTER) flag = true;
	return flag;
}



std::string V_Pin::getName(void) { return name; }
std::string V_Pin::getType(void) { return type; }
bool V_Pin::getSigned(void) { return sgn; }
unsigned int V_Pin::getBitWidth(void) { return bitWidth;}

void V_Pin::printPin() {
	std::cout << "Type: " << type << "; Bit Width: " << bitWidth << "; Name: " << name << std::endl;
}

