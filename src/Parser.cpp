
#include "Parser.h"

//using namespace std;
void Parser::parseFile(char* inFileStr, std::vector<string> *destVector) {

	std::string line;
	std::ifstream inFile(inFileStr, std::ifstream::in);


	if (inFile.is_open() && inFile.good()) {
	//	std::cout << "File Opened!" << std::endl;
	}
	else {
		std::cout << "File(s) not opened." << std::endl;
		//return std::vector<std::string>();
	}

	//std::cout << "Inside constructor" << std::endl;
	//fstream::getline()
	//line = new std::string;
	while (std::getline(inFile, line)) {
	//	std::cout << line << std::endl;
		if (line != "") {
			destVector->push_back(line);
		}
		//push_back(line);

	}


	inFile.close();

	//outFile.flush();
	//outFile.close();
	//return  lines;
}

vector<std::string> Parser::splitByWhitespace(std::string str) {

	string buf; // Have a buffer string
	stringstream ss(str); // Insert the string into a stream

	vector<string> tokens; // Create vector to hold our words

	while (ss >> buf) {
		buf.erase(std::remove(buf.begin(), buf.end(), ','), buf.end());
		tokens.push_back(buf);
		//std::cout << buf << std::endl;
	}
	return tokens;

}

std::string Parser::getModuleName(std::string filePath) {
	std::string name;
	std::string path;
	std::size_t found = filePath.find_last_of("/\\");


	//name = filePath.substr(found1 + 1).
	
	name = filePath.substr(found + 1);
	found = name.find_last_of(".");
	//std::cout << name;
	name = name.substr(0, found);
	//std::cout << name << endl;//filePath.substr(found + 1).substr(0, found);
	//path = filePath.substr(0, found2);

	return name;
	//std::cout << fileName << std::endl;
	//std::cout << filePath << std::endl;

}