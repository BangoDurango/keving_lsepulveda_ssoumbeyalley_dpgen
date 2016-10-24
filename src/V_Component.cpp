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
			//extraZeros1 = "{" + to_string(bitDiff) + "'b";
			
			ss1 << "{" << bitDiff << "'b0";
			 extraZeros1 =  ss1.str();

			//extraZeros1 = "{" + bitDiff + "'b";
			/*for (int i = 0; i < bitDiff; i++){
				extraZeros1.append("0");
			}*/
			extraZeros1.append(",");
			extraZeros1end = "}";
		}
	}
	if (bitDiff >= 0) {
		ss2 << "REG #(" << maxBitLength << ") REG_" << componentNumber
			<< "(" << extraZeros1 << in1->getName() << extraZeros1end << ","
			<< output->getName() << ",Clk,Rst)";
		verilogString = ss2.str();
	}
	else {
		int bitSub = 0;

		
		bitSub = in1->getBitWidth() + bitDiff;
		ss2 << "REG #(" << maxBitLength << ") REG_" << componentNumber
			<< "(" << in1->getName() << "[" << bitSub - 1 << ":" << 0 << "],"
			<< output->getName() << ",Clk,Rst)";
		verilogString = ss2.str();
	}
	//verilogString = "REG #(" + to_string(maxBitLength) + ") REG_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + output->getName() + ",Clk,Rst)";
//	std::cout << verilogString << std::endl;
}

V_Component::V_Component(V_Pin* In1, V_Pin* In2, V_Pin* Control, V_Pin* Output, int ComponentNumber){
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
			//extraZeros1 = "{" + to_string(bitDiff) + "'b";
			extraZeros1 = ss1.str();
			//for (int i = 0; i < bitDiff; i++){
			//	extraZeros1.append("0");
			//}
			extraZeros1.append(",");
			extraZeros1end = "}";
		}
		if (in2->getBitWidth() != maxBitLength){
			bitDiff = maxBitLength - in2->getBitWidth();
			//extraZeros2 = "{" + to_string(bitDiff) + "'b";
			ss1 << "{" << bitDiff << "'b0,";
			extraZeros2 = ss1.str();

			//for (int i = 0; i < bitDiff; i++){
				extraZeros2.append("0");
			//}6666666666
			extraZeros2.append(",");
			extraZeros2end = "}";
		}

	}
	ss1 << "MUX2x1 #(" << maxBitLength << ") MUX2x1_" << componentNumber 
		<< "(" << extraZeros1 << in1->getName() << extraZeros1end << "," << extraZeros2
		<< in2->getName() << extraZeros2end << "," << control->getName() << "," << output->getName() << ")";

	verilogString = ss1.str();

	//verilogString = "MUX #(" + to_string(maxBitLength) + ") MUX_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + extraZeros2 + in2->getName() + extraZeros2end + "," + control->getName() + "," + output->getName() + ")";
	
//std::cout << verilogString << std::endl;

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
	std::vector<V_Pin*> pins;
	pins.push_back(in1);
	pins.push_back(in2);
	pins.push_back(output);

	bool usgn;

	usgn = !(in1->getSigned() || in2->getSigned());

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
		int bitDiff = 0;
		if (in1->getBitWidth() != maxBitLength) {
			bitDiff = maxBitLength - in1->getBitWidth();
			ss1 << "{" << bitDiff << "'b0";
			extraZeros1 = ss1.str();
			ss1.str("");
			//extraZeros1 = "{" + to_string(bitDiff) + "'b";
			/*for (int i = 0; i < bitDiff; i++){
				extraZeros1.append("0");
			}*/

			extraZeros1.append(",");
			extraZeros1end = "}";
		}
		if (in2->getBitWidth() != maxBitLength) {
			bitDiff = maxBitLength - in2->getBitWidth();
			ss1 << "{" << bitDiff << "'b0";
			extraZeros2 = ss1.str();
			ss1.str("");
			//extraZeros2 = "{" + to_string(bitDiff) + "'b";
			/*for (int i = 0; i < bitDiff; i++){
				extraZeros2.append("0");
			}*/
			extraZeros2.append(",");
			extraZeros2end = "}";
		}
		ss1.str("");
	}

	if (operation == "+") {
		if (usgn) {component = "ADD";}
		else {component = "SADD";}
	}
	else if (operation == "-") {
		//component = "SUB";
		if (usgn) { component = "SUB"; }
		else { component = "SSUB"; }
	}
	else if (operation == "*") {
		//component = "MUL";
		if (usgn) { component = "MUL"; }
		else { component = "SMUL"; }
	}
	else if (operation == ">") {
		//component = "COMP";
		if (usgn) { component = "COMP"; }
		else { component = "SCOMP"; }
		compOper = 1;
	}
	else if (operation == "<") {
		if (usgn) { component = "COMP"; }
		else { component = "SCOMP"; }
		compOper = 2;
	}
	else if (operation == ">>") {
		component = "SHR";
	}
	else if (operation == "<<") {
		component = "SHL";
	}
	else if (operation == "==") {
		if (usgn) { component = "COMP"; }
		else { component = "SCOMP"; }
		compOper = 3;
	}
	else {
		std::cout << "Error! Invalid Operator: " << operation << std::endl;
		exit(1);
	}

	

	if (component == "COMP") {

		switch (compOper){
		case 1: 
		
			ss1 << component << " #(" << maxBitLength << ") " << component << "_" << componentNumber 
				<< "(" << extraZeros1 << in1->getName() << extraZeros1end << "," + extraZeros2 
				<< in2->getName() << extraZeros2end << "," << output->getName() << ",,)";
			tempString = ss1.str();
		//	tempString = component + " #(" + to_string(maxBitLength) + ") " + component + "_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + extraZeros2 + in2->getName() + extraZeros2end + "," + output->getName() + ",,)";
			break;
		case 2: 
			ss1 << component << " #(" << maxBitLength << ") " 
				<< component << "_" << componentNumber << "(" 
				<< extraZeros1 << in1->getName() << extraZeros1end << "," 
				<< extraZeros2 << in2->getName() << extraZeros2end << ",," 
				<< output->getName() << ",)";

			tempString = ss1.str();
			//tempString = component + " #(" + to_string(maxBitLength) + ") " + component + "_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + extraZeros2 + in2->getName() + extraZeros2end + ",," + output->getName() + ",)";
			break;
		case 3: 
			
			ss1.str("");
			ss1 << component << " #(" << maxBitLength << ") " << component
				<< "_" << componentNumber << "(" << extraZeros1
				<< in1->getName() << extraZeros1end << "," << extraZeros2
				<< in2->getName() << extraZeros2end << ",,," << output->getName() << ")";
			tempString = ss1.str();

			//tempString = component + " #(" + to_string(maxBitLength) + ") " + component + "_" + to_string(componentNumber) + "(" + extraZeros1 + in1->getName() + extraZeros1end + "," + extraZeros2 + in2->getName() + extraZeros2end + ",,," + output->getName() + ")";
			break;

		}
		ss1.str("");
	}
	else{
		ss1 << component << " #(" << maxBitLength << ") " 
			<< component << "_" << componentNumber << "(" 
			<< extraZeros1 << in1->getName() << extraZeros1end << "," 
			<< extraZeros2 << in2->getName() << extraZeros2end << "," 
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

