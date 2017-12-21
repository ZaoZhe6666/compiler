#include<iostream>
#include<fstream>
#include<string>
#include<cstdlib>
#include<cstring>
#include<cctype>
#include"table.h"
#include"mips.h"
#include"error.h"

using namespace std;

extern FT ft;
extern ST st;

MIPS::MIPS(){
	outf.open("mips.asm");
	outf << ".data" << endl;
//	outf << "\ttemp_register: .space 4096" << endl;
	outf << "\treturn_dota: .word 0" << endl;
	StringNum = -1;
	const_init_judge = 1;
	main_judge = 0;
	deal_func = "";
}

void MIPS::string_init(){
	outf << "\tErrorInfor: .asciiz \"Something Wrong1\"" << endl;
	int i;
	for(i=0;i<=StringNum;i++){
		outf << "\tstring" << i << ": .asciiz \"" << s_list[i] << "\""<<endl;
	}
	outf << endl;
	outf << endl;
	outf << ".text" << endl;
	if(main_judge){
		outf << "\tjal main" << endl;
		outf << "\tli $v0 10" << endl;
		outf << "\tsyscall" << endl;
	}
	return;
}

int MIPS::string_save(std::string name){
	StringNum++;
	s_list[StringNum] = name;
	return StringNum;
}

void MIPS::const_init(std::string name,int value){
	outf << "\t" << name << ": .word " << value << endl;
}

void MIPS::global_init(std::string name,int wide){
	wide *= 4;
	outf << "\t" << name << ": .space " << wide << endl;
}

int MIPS::getnum(std::string name){

}

int MIPS::getLocation(std::string name){
	return st.get_loc(deal_func,name,-1);
	
}

int MIPS::getLocation(int value){
	return st.get_loc(deal_func,"T",value);
}

void MIPS::mid2mips(PCode pcode){
	int num1 = pcode.num1;
	int num2 = pcode.num2;
	int num3 = pcode.num3;
	int stype = 0;
	std::string str = pcode.str;
	if(num1 == -9 && global_judge){
		const_init_judge = 0;
		global_judge = 0;
		string_init();
	}
	if(num1<0){
		if(num1 == -1){
			std::string sym_list[6] ={"li","add","sub","mul","div"};
			if(num3 == -1){
				int offset_right = getLocation(num2);
				int offset_left = getLocation(str);
				if(offset_left >= 0){
					outf << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
					outf << "\tsw $t1 " << (-1*offset_left)  << "($fp)" << endl;
				}
				else{
					outf << "\tlw $t0 " << (-1*offset_right) << "($fp)" << endl;
					outf << "\tlw $t1 " << str << "($0)" << endl;
					outf << "\tsw $t0 " << "0($t1)" << endl;
				}
			}
			else{
				if(num3 == 0){
					int offset_right = getLocation(str);
					int offset_left = getLocation(num2);
					if(offset_right >= 0){
						outf << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
						outf << "\tsw $t1 " << (-1*offset_left)  << "($fp)" << endl;
					}
					else{
						outf << "\tlw $t1 " << str << "($0)" << endl;
						outf << "\tsw $t1 " << (-1*offset_left)  << "($fp)" << endl;
					}
				}
				else{
					int offset_right = getLocation(str);
					int offset_left = getLocation(num2);
					if(offset_right >= 0){
						outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
						outf << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
						outf << "\t" <<sym_list[num3] << " $t0 $t0 $t1" << endl;
						outf << "\tsw $t0 " << (-1*offset_left)  << "($fp)" << endl;
					}
					else{
						outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
						outf << "\tlw $t1 " << str << "($0)" << endl;
						outf << "\t" <<sym_list[num3] << " $t0 $t0 $t1" << endl;
						outf << "\tsw $t0 " << (-1*offset_left)  << "($fp)" << endl;
					}
				}
			}
		}
		else if(num1 == -2){
			if(const_init_judge){
				const_init(str,num3);
			}
			else{
				int offset = getLocation(str);
				outf << "\tli $t0 " << num3 << endl;
				outf << "\tsw $t0 " << (-1*offset) << "($fp)" << endl;
			}
		}
		else if(num1 == -3){
			int para_offset = num3*4-4;
			int offset_right = getLocation(num2);
			outf << "\tlw $t0 " << (-1*offset_right) << "($fp)" << endl;
			outf << "\tsw $t0 0($sp)" << endl;
			outf << "\tsubi $sp $sp 4" << endl;
		}
		else if(num1 == -5){
			int offset_left = getLocation(num2);
			outf << "\tlw $t1 return_dota($0)" << endl;
			outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
			if(num3 == 3){
				outf << "\tmul $t0 $t0 $t1" << endl;
			}
			else{
				outf << "\tdiv $t0 $t0 $t1" << endl;
			}
			outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
		}
		else if(num1 == -6){
			if(num3 < 0){
				num3 *= -1;
				num3 -= 1;
				int offset_left = getLocation(num2);
				int offset_brack = getLocation(num3);
				int offset_sz = getLocation(str);
				
				outf << "\tlw $t2 " << (-1*offset_brack) << "($fp)" << endl;
				outf << "\tli $s0 4" << endl;
				outf << "\tmul $t2 $t2 $s0" << endl;
				if(offset_sz < 0){
					outf << "\tla $t1 " << str << endl;
					outf << "\tadd $t1 $t1 $t2" << endl;
					outf << "\tlw $t1 0($t1)" << endl;
				}
				else{
					outf << "\tli $t1 " << (-1*offset_sz) << endl;
					outf << "\tsub $t1 $t1 $t2" << endl;
					outf << "\tadd $t1 $t1 $fp" << endl;
					outf << "\tlw $t1 0($t1)" << endl;
				}
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tdiv $t0 $t0 $t1" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else{
				int offset_left = getLocation(num2);
				int offset_brack = getLocation(num3);
				int offset_sz = getLocation(str);
				outf << "\tlw $t2 " << (-1*offset_brack) << "($fp)" << endl;
				outf << "\tli $s0 4" << endl;
				outf << "\tmul $t2 $t2 $s0" << endl;
				if(offset_sz < 0){
					outf << "\tla $t1 " << str << endl;
					outf << "\tadd $t1 $t1 $t2" << endl;
					outf << "\tlw $t1 0($t1)" << endl;
				}
				else{
					outf << "\tli $t1 " << (-1*offset_sz) << endl;
					outf << "\tsub $t1 $t1 $t2" << endl;
					outf << "\tadd $t1 $t1 $fp" << endl;
					outf << "\tlw $t1 0($t1)" << endl;
				}
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tmul $t0 $t0 $t1" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
		}
		else if(num1 == -7){
			if(global_judge){
				global_init(str,num3);
			}
		}
		else if(num1 == -8){
			if(global_judge){
				const_init(str,0);
			}
		}
		else if(num1 == -9){
			deal_func = str;
			outf << endl;
			outf << endl;
			outf << str << ":" << endl;
			cout << "func name:" << str << "    para_offset:" << st.getpara_offset(str) << endl;
			outf << "\tsubi $sp $sp " << (getLocation(str)+ 8 - st.getpara_offset(str)) << endl;
			outf << "\tsw $fp 8($sp)" << endl;
			outf << "\tsw $ra 4($sp)" << endl;
			outf << "\taddi $fp $sp " << (getLocation(str)+8) << endl;
		}
		else if(num1 == -10){
			if(num3 == 1){
				outf << "\tli $v0 5" <<endl;
				outf << "\tsyscall" << endl;
			}
			else{
				outf << "\tli $v0 12" <<endl;
				outf << "\tsyscall" << endl;
			}
			int offset = getLocation(str);
			if(offset < 0){
				outf << "\tsw $v0 " << str << "($0)" << endl;
			}
			else{
				outf << "\tsw $v0 " << (-1*offset) << "($fp)" << endl;
			}
		}
		else if(num1 == -11){
			if(num2 == 0){
				int i_pr;
				for(i_pr=0;i_pr<StringNum;i_pr++){
					if(s_list[i_pr] == str){
						break;
					}
				}
				outf << "\tla $a0 string" << i_pr << endl;
				outf << "\tli $v0 4" << endl;
				outf << "\tsyscall" << endl;
			}
			else{
//				outf << "\tla $a0 ENT" << endl;
//				outf << "\tli $v0 4" << endl;
//				outf << "\tsyscall" << endl;
			}
		}
		else if(num1 == -12){
			outf << "\tjal " << str << endl;
		}
		else if(num1 == -13){
			int offset_right = getLocation(num3);
			int offset_off = getLocation(num2);
			int offset_sz = getLocation(str);
			
			outf << "\tlw $t1 " << (-1*offset_off) << "($fp)" << endl; 
			outf << "\tli $s0 4" << endl;
			outf << "\tmul $t1 $t1 $s0" << endl;
			if(offset_sz < 0){
				outf << "\tla $t0 " << str << endl;
				outf << "\tsub $t0 $t0 $t1" << endl;
			}
			else{
				outf << "\tli $t0 " << (-1*offset_sz) << endl;
				outf << "\tsub $t0 $t0 $t1" << endl;
				outf << "\tadd $t0 $t0 $fp" << endl;
			}
			outf << "\tlw $t2 " << (-1*offset_right) << "($fp)" << endl;
			outf << "\tsw $t2 0($t0)" << endl;
			
		}
	}
	else{
		if(str == "label"){
			outf << endl;
			outf << "label" << num3 << ":" << endl;
		}
		else if(str == "="){
			std::string sym_list[10]={"li","add","sub","mul","div","mul","subi","addi"};
			if(num2 < 0){
				num2 += 8;
				int offset_left = getLocation(num1);
				int offset_right = getLocation(num3);
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tli $t1 " << num3 << endl;
				outf << "\t" << sym_list[num2] << " $t0 $t0 $t1" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(num2 == 0){
				int offset_left = getLocation(num1);
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tli $t0 " << num3 << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else{
				int offset_left = getLocation(num1);
				int offset_right = getLocation(num3);
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
				outf << "\t" << sym_list[num2] << " $t0 $t0 $t1" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
		}
		else if(str == "<" || str == "<=" || str == "==" ||
				str == ">" || str == ">=" || str == "!="){
			int offset_left = getLocation(num1);
			int offset_right = getLocation(num3);
			outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
			outf << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
			outf << "\tsub $t0 $t0 $t1" << endl;
			if(str == "<"){
				outf << "\tslti $t0 $t0 0" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(str == "<="){
				outf << "\tslti $t0 $t0 1" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(str == "=="){
				outf << "\tslti $t1 $t0 1" << endl;
				outf << "\tli $t2 -1" << endl;
				outf << "\tslt $t2 $t2 $t0" << endl;
				outf << "\tand $t0 $t1 $t2" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(str == ">"){
				outf << "\tslt $t0 $0 $t0" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(str == ">="){
				outf << "\tli $t1 -1" << endl;
				outf << "\tslt $t0 $t1 $t0" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(str == "!="){
				outf << "\tslt $t1 $0 $t0" << endl;
				outf << "\tslti $t2 $t0 0" << endl;
				outf << "\tor $t0 $t1 $t2" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
		}
		else if(str == "ret"){
			if(num3 >= 0){
				int offset = getLocation(num2);
				outf << "\tlw $t0 " << (-1*offset) << "($fp)" << endl;
				outf << "\tsw $t0 return_dota($0)" << endl;
				outf << "\tlw $t0 4($sp)" << endl;
				outf << "\tmove $t1 $sp" << endl;
				outf << "\tmove $sp $fp" << endl;
				outf << "\tlw $fp 8($t1)" << endl;
				outf << "\tjr $t0" << endl;
			}
			else{
				outf << "\tlw $t0 4($sp)" << endl;
				outf << "\tmove $t1 $sp" << endl;
				outf << "\tmove $sp $fp" << endl;
				outf << "\tlw $fp 8($t1)" << endl;
				outf << "\tjr $t0" << endl;
			}
		}
		else if(str == "jmp"){
			int offset = getLocation(num1);
			outf << "\tlw $t0 " << (-1*offset) << "($fp)" << endl;
			if(num2<0){
				outf << "\tbne $t0 $0 label" << num3 << endl;
			}
			else{
				outf << "\tbeq $t0 $0 label" << num3 << endl;
			}
		}
		else if(str == "case"){
			int offset_left = getLocation(num1);
			outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
			outf << "\tli $t1 " << num2 << endl;
			outf << "\tbne $t0 $t1 label" << num3 << endl;
		}
		else if(str == "pr"){
			int offset = getLocation(num3);
			outf << "\tlw $t0 " << (-1*offset) << "($fp)" << endl;
			outf << "\tmove $a0 $t0" << endl;
			if(num2 == 0){
				outf << "\tli $v0 1" << endl;
			}
			else{
				outf << "\tli $v0 11" << endl;
			}
			outf << "\tsyscall" << endl;
//			outf << "\tla $a0 ENT" << endl;
//			outf << "\tli $v0 4" << endl;
//			outf << "\tsyscall" << endl;
		}
		else if(str == "endfunc"){
			if(num2 < 0){
				outf << "\tli $v0 10" << endl;
				outf << "\tsyscall" << endl;
				outf << "ErrorDeal:"<< endl;
				outf << "\tla $a0 ErrorInfor" << endl;
				outf << "\tli $v0 4" << endl;
				outf << "\tsyscall" << endl;
			}
			else if(num3 < 0){
				outf << "\tj ErrorDeal" << endl;
			}
			else{
				outf << "\tlw $t0 4($sp)" << endl;
				outf << "\tmove $t1 $sp" << endl;
				outf << "\tmove $sp $fp" << endl;
				outf << "\tlw $fp 8($t1)" << endl;
				outf << "\tjr $t0" << endl;
			}
		}
	}
}