#include "V_Component.h"

V_Component::V_Component(V_Pin* In1, V_Pin* In2, V_Pin* Output, std::string Operation, int ComponentNumber) {
	componentNumber = ComponentNumber;
	in1 = In1;
	in2 = In2;
	output = Output;
	operation = Operation;
	//verilogString = this->buildVerilogString(in1, in2, output, operation);
	verilogString = this->buildVerilogString();
}

V_Component::V_Component(V_Pin* In1, V_Pin* Output, int ComponentNumber){
	//FOR REGISTERS
	componentNumber = ComponentNumber;
	in1 = In1;
	in2 = NULL;
	output = Output;
	unsigned int maxBitLength = 0;
	bool equalBits = false;
	operation = "";
	std::string extraZeros1 = "";
	std::string extraZeros1end = "";
	std::stringstream ss1;
	std::stringstream ss2;



	sgn = (in1->getSigned() && output->getSigned());


	if (in1->getBitWidth()  == output->getBitWidth()){
		maxBitLength = in1->getBitWidth();
		equalBits = true;
	}
	else{
		equalBits = false;
		if (in1->getBitWidth() < output->getBitWidth()){
			maxBitLength = output->getBitWidth();
		}
		else{
			maxBitLength = output->getBitWidth();
		}
	}
	int bitDiff = 0;
	if (equalBits == false){
		
		if (in1->getBitWidth() != maxBitLength){
			bitDiff = maxBitLength - in1->getBitWidth();
			ss1 << "{" << bitDiff << "'b0";
			extraZeros1 =  ss1.str();
			extraZeros1.append(",");
			extraZeros1end = "}";
		}
	}



	if (bitDiff >= 0) {
		ss2 << "REG #(" << maxBitLength << ") REG_" << componentNumber
			<< "(" << extraZeros1 << in1->getName() << extraZeros1end << ","
			<< "Clk, Rst, "<< output->getName() << ")";
		verilogString = ss2.str();
	}
	else {
		int bitSub = 0;

		
		bitSub = in1->getBitWidth() + bitDiff;
		ss2 << "REG #(" << maxBitLength << ") REG_" << componentNumber
			<< "(" << in1->getName() << "[" << bitSub - 1 << ":" << 0 << "],"
			<< "Clk, Rst, "<< output->getName() << ")";
		verilogString = ss2.str();
		//d,clk,rst,q
		
	}

	if (sgn) verilogString = "S" + verilogString;

}

V_Component::V_Component(V_Pin* In1, V_Pin* In2, V_Pin* Control, V_Pin* Output, int ComponentNumber){

	//FOR MULTIPLEXERS
	componentNumber = ComponentNumber;
	in1 = In1;
	in2 = In2;
	std::string extraZeros1 = "";
	std::string extraZeros1end = "";
	std::stringstream ss1;
	std::string extraZeros2 = "";
	std::string extraZeros2end = "";
	//std::stringstream ss1;

	control = Control;
	output = Output;
	unsigned int maxBitLength = 0;
	bool equalBits = false;
	operation = "";
	std::vector<V_Pin*> pins;
	pins.push_back(in1);
	pins.push_back(in2);
	pins.push_back(output);

	std::stringstream ssIn1;
	std::stringstream ssIn2;
	std::string newPin1Name;
	std::string newPin2Name;


	if ((in1->getBitWidth() == output->getBitWidth()) && (in2->getBitWidth() == output->getBitWidth())){
		maxBitLength = in1->getBitWidth();
		equalBits = true;
	}
	else{
		equalBits = false;
		for (std::vector<V_Pin*>::iterator it = pins.begin(); it != pins.end(); ++it){
			if (maxBitLength < (*it)->getBitWidth()){
				maxBitLength = (*it)->getBitWidth();
			}
		}
	}

	if (equalBits == false){
		int bitDiff = 0;
		if (in1->getBitWidth() != maxBitLength){
			bitDiff = maxBitLength - in1->getBitWidth();
			ss1 << "{" << bitDiff << "'b0,";
			extraZeros1 = ss1.str();
			extraZeros1.append(",");
			extraZeros1end = "}";
		}
		if (in2->getBitWidth() != maxBitLength){
			bitDiff = maxBitLength - in2->getBitWidth();
			ss1 << "{" << bitDiff << "'b0,";
			extraZeros2 = ss1.str();
			extraZeros2.append(",");
			extraZeros2end = "}";
		}

	}


	ssIn1 << extraZeros1 << in1->getName() << extraZeros1end;
	ssIn2 << extraZeros2 << in2->getName() << extraZeros2end;

	newPin1Name = ssIn1.str();
	newPin2Name = ssIn2.str();


	ss1 << "MUX2x1 #(" << maxBitLength << ") MUX2x1_" << componentNumber 
		<< "(" << newPin1Name << "," << newPin2Name << "," << control->getName() << "," << output->getName() << ")";

	verilogString = ss1.str();


}

//std::string V_Component::buildVerilogString(V_Pin* In1, V_Pin* In2, V_Pin* Output, std::string inputOperation){
std::string V_Component::buildVerilogString() {
	unsigned int maxBitLength = 0;
	int compOper = 0;
	bool equalBits = false;
	std::string tempString;
	std::string component;
	std::string extraZeros1 = "";
	std::string extraZeros1end = "";
	std::string extraZeros2 = "";
	std::string extraZeros2end = "";
	std::stringstream ss1;
	std::stringstream ss2;
	std::vector<V_Pin*> pins;
	pins.push_back(in1);
	pins.push_back(in2);
	pins.push_back(output);
	int bitDiff = 0;
	std::string strPin1;
	std::string strPin2;

	strPin1 = in1->getName();
	strPin2 = in2->getName();
	bool a, b, c, d;
	a = in1->getSigned();
	b = in2->getSigned();
	c = output->getSigned();
	sgn = (in1->getSigned() && in2->getSigned() && output->getSigned());


	if ((in1->getBitWidth() == in2->getBitWidth()) && (in2->getBitWidth() == output->getBitWidth())) {
		maxBitLength = in1->getBitWidth();
		equalBits = true;
	}
	else {
		equalBits = false;
		for (std::vector<V_Pin*>::iterator it = pins.begin(); it != pins.end(); ++it) {
			if (maxBitLength < (*it)->getBitWidth()) {
				maxBitLength = (*it)->getBitWidth();
			}
		}
	}

	if (equalBits == false) {
		bitDiff = 0;
		if (in1->getBitWidth() != maxBitLength) {
			bitDiff = maxBitLength - in1->getBitWidth();
			if (!sgn){
				ss1 << "{" << bitDiff << "'b0," << in1->getName() << "}";
				strPin1 = ss1.str();
				ss1.str("");
				//extraZeros1.append(",");
				//extraZeros1end = "}";
			}
			else {
				ss1 << "{{" << bitDiff << "{" << in1->getName() << "[" << in1->getBitWidth() - 1 << "]}},"
					<< in1->getName() << "}";
				strPin1 = ss1.str();
				ss1.str("");
				//extraZeros1.append(",");
				//extraZeros1end = "}";
			}
		}
		//Github can eat me.
		if (in2->getBitWidth() != maxBitLength) {
			bitDiff = maxBitLength - in2->getBitWidth();
			if (!sgn) {
				ss2 << "{" << bitDiff << "'b0," << in2->getName() << "}";
				strPin2 = ss2.str();
				ss2.str("");
			}
			else {
				ss2 << "{{" << bitDiff << "{" << in2->getName() << "[" << in2->getBitWidth() - 1 << "]}},"
						<< in2->getName() << "}";
				strPin2 = ss2.str();
				ss2.str("");
				//extraZeros1.append(",");
				//extraZeros1end = "}";
			}
		/*
			ss1 << "{" << bitDiff << "'b0";
			extraZeros2 = ss1.str();
			ss1.str("");
			extraZeros2.append(",");
			extraZeros2end = "}";*/
		}
		//ss1.str("");
	}
	
	//if 
	if (operation == "+") {
		if (!sgn) {component = "ADD";}
		else {component = "SADD";}
	}
	else if (operation == "-") {
		//component = "SUB";
		if (!sgn) { component = "SUB"; }
		else { component = "SSUB"; }
	}
	else if (operation == "*") {
		//component = "MUL";
		if (!sgn) { component = "MUL"; }
		else { component = "SMUL"; }
	}
	else if (operation == ">") {
		//component = "COMP";
		if (!sgn) { component = "COMP"; }
		else { component = "SCOMP"; }
		compOper = 1;
	}
	else if (operation == "<") {
		if (!sgn) { component = "COMP"; }
		else { component = "SCOMP"; }
		compOper = 2;
	}
	else if (operation == ">>") {
		if (!sgn) { component = "SHR"; }
		else { component = "SSHR"; }
		///component = "SHR";
		strPin2 = in2->getName();
	}
	else if (operation == "<<") {
		if (!sgn) { component = "SHL"; }
		else { component = "SSHL"; }
		strPin2 = in2->getName();
		///component = "SHL";
	}
	else if (operation == "==") {
		if (!sgn) { component = "COMP"; }
		else { component = "SCOMP"; }
		compOper = 3;
	}
	else {
		std::cout << "Error! Invalid Operator: " << operation << std::endl;
		exit(1);
	}


	if (component == "COMP" || component == "SCOMP") {

		switch (compOper){
		case 1: 
		
			ss1 << component << " #(" << maxBitLength << ") " << component << "_" << componentNumber 
				<< "(" << strPin1 << "," << strPin2 << "," << output->getName() << ",,)";
			tempString = ss1.str();
		//	tempString = component + " #(" + to_string(maxBitLength) + ") " + component + "_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + extraZeros2 + in2->getName() + extraZeros2end + "," + output->getName() + ",,)";
			break;
		case 2: 
			ss1 << component << " #(" << maxBitLength << ") " 
				<< component << "_" << componentNumber << "(" 
				<< strPin1 << ","
				<< strPin2 << ",,"
				<< output->getName() << ",)";

			tempString = ss1.str();
			//tempString = component + " #(" + to_string(maxBitLength) + ") " + component + "_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + extraZeros2 + in2->getName() + extraZeros2end + ",," + output->getName() + ",)";
			break;
		case 3: 
			
			ss1.str("");
			ss1 << component << " #(" << maxBitLength << ") " << component
				<< "_" << componentNumber << "(" << strPin1 << "," << strPin2 << ",,," << output->getName() << ")";
			tempString = ss1.str();

			//tempString = component + " #(" + to_string(maxBitLength) + ") " + component + "_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + extraZeros2 + in2->getName() + extraZeros2end + ",,," + output->getName() + ")";
			break;

		}
		ss1.str("");
	}
	else{
		ss1 << component << " #(" << maxBitLength << ") " 
			<< component << "_" << componentNumber << "(" 
			<< strPin1 << ","
			<< strPin2 << ","
			<< output->getName() << ")";
		tempString = ss1.str();
		ss1.str("");
		//tempString = component + " #(" + to_string(maxBitLength) + ") " + component + "_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + extraZeros2 + in2->getName() + extraZeros2end + "," + output->getName() + ")";
	}
	
	//testing
	//cout << tempString << endl;
	//ss1.str("");
	return tempString;
}

