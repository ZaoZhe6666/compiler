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

char *TEMP_GEN[20]={"$zero",
					"$t2",	"$t3",	"$t4",
					"$t5",	"$t6",	"$t7",
					"$s0",	"$s2",	"$s3",
					"$s4",	"$s5",	"$s6",
					"$s7",	"$t8",	"$t9"
							 }; 

MIPS::MIPS(){
	outf.open("mips.asm");
	outf << ".data" << endl;
	outf_MT2T.open("mips_MT2T.asm");
	outf_MT2T << ".data" << endl;
//	outf << "\ttemp_register: .space 4096" << endl;
//	outf << "\treturn_dota: .word 0" << endl;
	StringNum = -1;
	const_init_judge = 1;
	main_judge = 0;
	deal_func = "";
	max_temp = 0;
}

void MIPS::string_init(){
	outf << "\tErrorInfor: .asciiz \"Something Wrong!\"" << endl;
	outf_MT2T << "\tErrorInfor: .asciiz \"Something Wrong!\"" << endl;
	int i;
	for(i=0;i<=StringNum;i++){
		outf << "\tSTRING" << i << ": .asciiz \"" << s_list[i] << "\""<<endl;
		outf_MT2T << "\tSTRING" << i << ": .asciiz \"" << s_list[i] << "\""<<endl;
	}
	outf << endl;
	outf << endl;
	outf << ".text" << endl;
	outf_MT2T << "\n\n.text" << endl;
	if(main_judge){
		outf << "\tjal main" << endl;
		outf << "\tli $v0 10" << endl;
		outf << "\tsyscall" << endl;
		outf_MT2T << "\tjal main" << endl;
		outf_MT2T << "\tli $v0 10" << endl;
		outf_MT2T << "\tsyscall" << endl;
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
	outf_MT2T << "\t" << name << ": .word " << value << endl;
}

void MIPS::global_init(std::string name,int wide){
	wide *= 4;
	outf << "\t" << name << ": .space " << wide << endl;
	outf_MT2T << "\t" << name << ": .space " << wide << endl;
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
					outf << "\tsw $t0 " << str << "($0)" << endl;
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
			outf << "\tmove $t1 $s1" << endl;
			if(num3 == 3){
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tmul $t0 $t0 $t1" << endl;
			}
			else if(num3 == 4){
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tdiv $t0 $t0 $t1" << endl;
			}
			else if(num3 == 2){
				outf << "\tmove $t0 $s1" << endl;
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
				
				outf << "\tlw $t0 " << (-1*offset_brack) << "($fp)" << endl;
				outf << "\tmul $t0 $t0 4" << endl;
				if(offset_sz < 0){
					outf << "\tla $t1 " << str << endl;
					outf << "\tadd $t1 $t1 $t0" << endl;
					outf << "\tlw $t1 0($t1)" << endl;
				}
				else{
					outf << "\tli $t1 " << (-1*offset_sz) << endl;
					outf << "\tsub $t1 $t1 $t0" << endl;
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
				outf << "\tlw $t0 " << (-1*offset_brack) << "($fp)" << endl;
				outf << "\tmul $t0 $t0 4" << endl;
				if(offset_sz < 0){
					outf << "\tla $t1 " << str << endl;
					outf << "\tadd $t1 $t1 $t0" << endl;
					outf << "\tlw $t1 0($t1)" << endl;
				}
				else{
					outf << "\tli $t1 " << (-1*offset_sz) << endl;
					outf << "\tsub $t1 $t1 $t0" << endl;
					outf << "\tadd $t1 $t1 $fp" << endl;
					outf << "\tlw $t1 0($t1)" << endl;
				}
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tmul $t0 $t0 $t1" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
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
				outf << "\tla $a0 STRING" << i_pr << endl;
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
			outf << "\tmul $t1 $t1 4" << endl;
			if(offset_sz < 0){
				outf << "\tla $t0 " << str << endl;
				outf << "\tadd $t0 $t0 $t1" << endl;
			}
			else{
				outf << "\tli $t0 " << (-1*offset_sz) << endl;
				outf << "\tsub $t0 $t0 $t1" << endl;
				outf << "\tadd $t0 $t0 $fp" << endl;
			}
			outf << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
			outf << "\tsw $t1 0($t0)" << endl;
			
		}
	}
	else{
		if(str == "label"){
			outf << endl;
			outf << "label" << num3 << ":" << endl;
		}
		else if(str == "="){
			std::string sym_list[10]={"li","add","sub","mul","div","mul","subi","addi"};
			if(num2 == -6){
				int offset_left = getLocation(num1);
				int offset_right = getLocation(num3);
				outf << "\tlw $t0 " << (-1*offset_right) << "($fp)" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(num2 == -5){
				int offset_left = getLocation(num1);
				outf << "\tli $t0 " << num3 << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(num2 < 0){
				num2 += 8;
				int offset_left = getLocation(num1);
				outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf << "\tli $t1 " << num3 << endl;
				outf << "\t" << sym_list[num2] << " $t0 $t0 $t1" << endl;
				outf << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
			}
			else if(num2 == 0){
				int offset_left = getLocation(num1);
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
			if(num2<0){
				num2 *= -1;
				if(str == "=="){
					str = "!=";
				}
				else if(str == "!="){
					str = "==";
				}
				else if(str == ">="){
					str = "<";
				}
				else if(str == "<="){
					str = ">";
				}
				else if(str == ">"){
					str = "<=";
				}
				else if(str == "<"){
					str = ">=";
				}
			}
			int offset_left = getLocation(num1);
			int offset_right = getLocation(num3);
			outf << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
			outf << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
			outf << "\tsub $t0 $t0 $t1" << endl;
			if(str == "<"){
				outf << "\tbltz $t0 label" << num2 << endl;
			}
			else if(str == "<="){
				outf << "\tblez $t0 label" << num2 << endl;
			}
			else if(str == "=="){
				outf << "\tbeqz $t0 label" << num2 << endl;
			}
			else if(str == ">"){
				outf << "\tbgtz $t0 label" << num2 << endl;
			}
			else if(str == ">="){
				outf << "\tbgez $t0 label" << num2 << endl;
			}
			else if(str == "!="){
				outf << "\tbnez $t0 label" << num2 << endl;
			}
		}
		else if(str == "ret"){
			if(num3 >= 0){
				int offset = getLocation(num2);
				outf << "\tlw $s1 " << (-1*offset) << "($fp)" << endl;
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


void MIPS::mid2mips_MemT2Temp(PCode pcode){
	/*优化了运行块内部变量T1~Tn，改用$t1~$tn代替*/
	int num1 = pcode.num1;
	int num2 = pcode.num2;
	int num3 = pcode.num3;
	int stype = 0;
	std::string str = pcode.str;
	if(num1<0){
		if(num1 == -1){
			std::string sym_list[6] ={"li","add","sub","mul","div"};
			if(num3 == -1){
				int offset_right = getLocation(num2);
				int offset_left = getLocation(str);
				if(num2 > 15){
					outf_MT2T << "\tlw $t0 " << (-1*offset_right) << "($fp)" << endl;
					if(offset_left >= 0){
						outf_MT2T << "\tsw $t0 " << (-1*offset_left)  << "($fp)" << endl;
					}
					else{
						outf_MT2T << "\tsw $t0 " << str << "($0)" << endl;
					}
				}
				else{
					max_temp = num2;
					if(offset_left >= 0){
						outf_MT2T << "\tsw " << TEMP_GEN[num2] << " " << (-1*offset_left)  << "($fp)" << endl;
					}
					else{
						outf_MT2T << "\tsw " << TEMP_GEN[num2] << " " << str << "($0)" << endl;
					}
				}
			}
			else{
				if(num3 == 0){
					int offset_right = getLocation(str);
					int offset_left = getLocation(num2);
					if(num2 > 15){
						if(offset_right >= 0){
							outf_MT2T << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
						}
						else{
							outf_MT2T << "\tlw $t1 " << str << "($0)" << endl;
						}
						outf_MT2T << "\tsw $t1 " << (-1*offset_left)  << "($fp)" << endl;
					}
					else{
						if(num2 > max_temp){
							max_temp = num2;
						}
						if(offset_right >= 0){
							outf_MT2T << "\tlw " << TEMP_GEN[num2] << " " << (-1*offset_right) << "($fp)" << endl;
						}
						else{
							outf_MT2T << "\tlw " << TEMP_GEN[num2] << " " << str << "($0)" << endl;
						}
					}
				}
				else{
					int offset_right = getLocation(str);
					int offset_left = getLocation(num2);
					if(offset_right >= 0){
						outf_MT2T << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
						
					}
					else{
						outf_MT2T << "\tlw $t1 " << str << "($0)" << endl;
					}
					if(num2 > 15){
						outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
						outf_MT2T << "\t" <<sym_list[num3] << " $t0 $t0 $t1" << endl;
						outf_MT2T << "\tsw $t0 " << (-1*offset_left)  << "($fp)" << endl;
					}
					else{
						if(num2 > max_temp){
							max_temp = num2;
						}
						outf_MT2T << "\t" <<sym_list[num3] << " " << TEMP_GEN[num2] << " " << TEMP_GEN[num2] << " $t1" << endl;
					}
				}
			}
		}
		else if(num1 == -2){
			if(const_init_judge){
			}
			else{
				int offset = getLocation(str);
				outf_MT2T << "\tli $t0 " << num3 << endl;
				outf_MT2T << "\tsw $t0 " << (-1*offset) << "($fp)" << endl;
			}
		}
		else if(num1 == -3){
			int para_offset = num3*4-4;
			int offset_right = getLocation(num2);
			if(num2 > 15){
				outf_MT2T << "\tlw $t0 " << (-1*offset_right) << "($fp)" << endl;
				outf_MT2T << "\tsw $t0 0($sp)" << endl;
			}
			else{
				max_temp = num2 - 1;
				outf_MT2T << "\tsw " << TEMP_GEN[num2] << " 0($sp)" << endl;
			}
			outf_MT2T << "\tsubi $sp $sp 4" << endl;
		}
		else if(num1 == -5){
			int offset_left = getLocation(num2);
			if(num2 > 15){
				if(num3 == 2){
					outf_MT2T << "\tsw $s1 " << (-1*offset_left) << "($fp)" << endl;
				}
				else if(num3 == 3){
					outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
					outf_MT2T << "\tmul $t0 $t0 $s1" << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else if(num3 == 4){
					outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
					outf_MT2T << "\tdiv $t0 $t0 $s1" << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
			}
			else{
				if(num3 == 2){
					outf_MT2T << "\tmove " << TEMP_GEN[num2] << " $s1" << endl;
				}
				else if(num3 == 3){
					outf_MT2T << "\tmul " << TEMP_GEN[num2] << " " << TEMP_GEN[num2] << " $s1" << endl;
				}
				else if(num3 == 4){
					outf_MT2T << "\tdiv " << TEMP_GEN[num2] << " " << TEMP_GEN[num2] << " $s1" << endl;
				}
			}
		}
		else if(num1 == -6){
			if(num3 < 0){
				num3 *= -1;
				num3 -= 1;
				int offset_left = getLocation(num2);
				int offset_brack = getLocation(num3);
				int offset_sz = getLocation(str);
				if(num3 > 15){
					outf_MT2T << "\tlw $t0 " << (-1*offset_brack) << "($fp)" << endl;
					outf_MT2T << "\tmul $t0 $t0 4" << endl;
				}
				else{
					if(num3 >max_temp){
						max_temp = num3;
					}
					outf_MT2T << "\tmul $t0 " << TEMP_GEN[num3] << " 4" << endl;
				}
				if(offset_sz < 0){
					outf_MT2T << "\tla $t1 " << str << endl;
					outf_MT2T << "\tadd $t1 $t1 $t0" << endl;
					outf_MT2T << "\tlw $t1 0($t1)" << endl;
				}
				else{
					outf_MT2T << "\tli $t1 " << (-1*offset_sz) << endl;
					outf_MT2T << "\tsub $t1 $t1 $t0" << endl;
					outf_MT2T << "\tadd $t1 $t1 $fp" << endl;
					outf_MT2T << "\tlw $t1 0($t1)" << endl;
				}
				if(num2 > 15){
					outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
					outf_MT2T << "\tdiv $t0 $t0 $t1" << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else{
					if(num2 > max_temp){
						max_temp = num2;
					}
					outf_MT2T << "\tdiv " << TEMP_GEN[num2] << " " << TEMP_GEN[num2] << " $t1" << endl;
				}
			}
			else{
				int offset_left = getLocation(num2);
				int offset_brack = getLocation(num3);
				int offset_sz = getLocation(str);
				if(num3 > 15){
					outf_MT2T << "\tlw $t0 " << (-1*offset_brack) << "($fp)" << endl;
					outf_MT2T << "\tmul $t0 $t0 4" << endl;
				}
				else{
					if(num3 > max_temp){
						max_temp = num3;
					}
					outf_MT2T << "\tmul $t0 " << TEMP_GEN[num3] << " 4" << endl;
				}
				if(offset_sz < 0){
					outf_MT2T << "\tla $t1 " << str << endl;
					outf_MT2T << "\tadd $t1 $t1 $t0" << endl;
					outf_MT2T << "\tlw $t1 0($t1)" << endl;
				}
				else{
					outf_MT2T << "\tli $t1 " << (-1*offset_sz) << endl;
					outf_MT2T << "\tsub $t1 $t1 $t0" << endl;
					outf_MT2T << "\tadd $t1 $t1 $fp" << endl;
					outf_MT2T << "\tlw $t1 0($t1)" << endl;
				}
				if(num2 > 15){
					outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
					outf_MT2T << "\tmul $t0 $t0 $t1" << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else{
					if(num2 > max_temp){
						max_temp = num2;
					}
					outf_MT2T << "\tmul " << TEMP_GEN[num2] << " " << TEMP_GEN[num2] << " $t1" << endl;
				}
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
			max_temp = 0;
			deal_func = str;
			outf_MT2T << endl;
			outf_MT2T << endl;
			outf_MT2T << str << ":" << endl;
			cout << "func name:" << str << "    para_offset:" << st.getpara_offset(str) << endl;
			outf_MT2T << "\tsubi $sp $sp " << (getLocation(str)+ 8 - st.getpara_offset(str)) << endl;
			outf_MT2T << "\tsw $fp 8($sp)" << endl;
			outf_MT2T << "\tsw $ra 4($sp)" << endl;
			outf_MT2T << "\taddi $fp $sp " << (getLocation(str)+8) << endl;
		}
		else if(num1 == -10){
			if(num3 == 1){
				outf_MT2T << "\tli $v0 5" <<endl;
				outf_MT2T << "\tsyscall" << endl;
			}
			else{
				outf_MT2T << "\tli $v0 12" <<endl;
				outf_MT2T << "\tsyscall" << endl;
			}
			int offset = getLocation(str);
			if(offset < 0){
				outf_MT2T << "\tsw $v0 " << str << "($0)" << endl;
			}
			else{
				outf_MT2T << "\tsw $v0 " << (-1*offset) << "($fp)" << endl;
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
				outf_MT2T << "\tla $a0 STRING" << i_pr << endl;
				outf_MT2T << "\tli $v0 4" << endl;
				outf_MT2T << "\tsyscall" << endl;
			}
			else{
//				outf_MT2T << "\tla $a0 ENT" << endl;
//				outf_MT2T << "\tli $v0 4" << endl;
//				outf_MT2T << "\tsyscall" << endl;
			}
		}
		else if(num1 == -12){
			int tempi;
			int m_t = max_temp;
			for(tempi=1;tempi<=m_t;tempi++){
				int offset_temp = getLocation(tempi);
				outf_MT2T << "\tsw " << TEMP_GEN[tempi] << " " << (-1 * offset_temp) << "($fp)" << endl;
			}
			outf_MT2T << "\tjal " << str << endl;
			for(tempi=1;tempi<=m_t;tempi++){
				int offset_temp = getLocation(tempi);
				outf_MT2T << "\tlw " << TEMP_GEN[tempi] << " " << (-1 * offset_temp) << "($fp)" << endl;
			}
			max_temp = 0;
		}
		else if(num1 == -13){
			int offset_right = getLocation(num3);
			int offset_off = getLocation(num2);
			int offset_sz = getLocation(str);
			if(num2 > 15){
				outf_MT2T << "\tlw $t1 " << (-1*offset_off) << "($fp)" << endl; 
				outf_MT2T << "\tmul $t1 $t1 4" << endl;
			}
			else{
				max_temp = num2;
				outf_MT2T << "\tmul $t1 " << TEMP_GEN[num2] << " 4" << endl;
			}
			if(offset_sz < 0){
				outf_MT2T << "\tla $t0 " << str << endl;
				outf_MT2T << "\tadd $t0 $t0 $t1" << endl;
			}
			else{
				outf_MT2T << "\tli $t0 " << (-1*offset_sz) << endl;
				outf_MT2T << "\tsub $t0 $t0 $t1" << endl;
				outf_MT2T << "\tadd $t0 $t0 $fp" << endl;
			}
			if(num3 > 15){
				outf_MT2T << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
				outf_MT2T << "\tsw $t1 0($t0)" << endl;
			}
			else{
				outf_MT2T << "\tsw " << TEMP_GEN[num3] << " 0($t0)" << endl;
			}
		}
	}
	else{
		if(str == "label"){
			outf_MT2T << endl;
			outf_MT2T << "label" << num3 << ":" << endl;
		}
		else if(str == "="){
			std::string sym_list[10]={"li","add","sub","mul","div","mul","subi","addi"};
			if(num2 == -6){
				int offset_left = getLocation(num1);
				int offset_right = getLocation(num3);
				if(num3 > 15 && num1 > 15){
					outf_MT2T << "\tlw $t0 " << (-1*offset_right) << "($fp)" << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else if(num3 > 15){
					if(num1 > max_temp){
						max_temp = num1;
					}
					outf_MT2T << "\tlw " << TEMP_GEN[num1] << " " << (-1*offset_right) << "($fp)" << endl;
				}
				else if(num1 > 15){
					if(num3 > max_temp){
						max_temp = num3;
					}
					outf_MT2T << "\tsw " << TEMP_GEN[num3] << " " << (-1*offset_left) << "($fp)" << endl;
				}
				else{
					if(num1 > max_temp){
						max_temp = num1;
					}
					if(num3 > max_temp){
						max_temp = num3;
					}
					outf_MT2T << "\tmove " << TEMP_GEN[num1] <<  " " << TEMP_GEN[num3] << endl;
				}
			}
			else if(num2 == -5){
				int offset_left = getLocation(num1);
				if(num1 > 15){
					outf_MT2T << "\tli $t0 " << num3 << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else{
					if(num1 > max_temp){
						max_temp = num1;
					}
					outf_MT2T << "\tli " << TEMP_GEN[num1] << " " << num3 << endl;
				}
			}
			else if(num2 < 0){
				num2 += 8;
				int offset_left = getLocation(num1);
				outf_MT2T << "\tli $t1 " << num3 << endl;
				if(num1 > 15){
					outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
					outf_MT2T << "\t" << sym_list[num2] << " $t0 $t0 $t1" << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else{
					if(num1 > max_temp){
						max_temp = num1;
					}
					outf_MT2T << "\t" << sym_list[num2] << " " << TEMP_GEN[num1] << " " << TEMP_GEN[num1] << " $t1" << endl;
				}
			}
			else if(num2 == 0){
				int offset_left = getLocation(num1);
				if(num1 > 15){
					outf_MT2T << "\tli $t0 " << num3 << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else{
					outf_MT2T << "\tli " << TEMP_GEN[num1] << " " << num3 << endl;
				}
			}
			else{
				int offset_left = getLocation(num1);
				int offset_right = getLocation(num3);
				if(num1 > 15 && num3 > 15){
					outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
					outf_MT2T << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
					outf_MT2T << "\t" << sym_list[num2] << " $t0 $t0 $t1" << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else if(num1 > 15){
					if(num3 > max_temp){
						max_temp = num3;
					}
					outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
					outf_MT2T << "\t" << sym_list[num2] << " $t0 $t0 " << TEMP_GEN[num3] << endl;
					outf_MT2T << "\tsw $t0 " << (-1*offset_left) << "($fp)" << endl;
				}
				else if(num3 > 15){
					if(num1 > max_temp){
						max_temp = num1;
					}
					outf_MT2T << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
					outf_MT2T << "\t" << sym_list[num2] << " " << TEMP_GEN[num1] << " " << TEMP_GEN[num1] << " $t1" << endl;
				}
				else{
					if(num1 > max_temp){
						max_temp = num1;
					}
					if(num3 > max_temp){
						max_temp = num3;
					}
					outf_MT2T << "\t" << sym_list[num2] << " " << TEMP_GEN[num1] << " " << TEMP_GEN[num1] << " " << TEMP_GEN[num3] << endl;
				}
			}
		}
		else if(str == "<" || str == "<=" || str == "==" ||
				str == ">" || str == ">=" || str == "!="){
			if(num2<0){
				num2 *= -1;
				if(str == "=="){
					str = "!=";
				}
				else if(str == "!="){
					str = "==";
				}
				else if(str == ">="){
					str = "<";
				}
				else if(str == "<="){
					str = ">";
				}
				else if(str == ">"){
					str = "<=";
				}
				else if(str == "<"){
					str = ">=";
				}
			}
			int offset_left = getLocation(num1);
			int offset_right = getLocation(num3);
			if(num1 > 15 && num3 > 15){
				outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf_MT2T << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
				outf_MT2T << "\tsub $t0 $t0 $t1" << endl;
			}
			else if(num1 > 15){
				if(num3 > max_temp){
					max_temp = num3;
				}
				outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf_MT2T << "\tsub $t0 $t0 " << TEMP_GEN[num3] << endl;
			}
			else if(num3 > 15){
				if(num1 > max_temp){
					max_temp = num1;
				}
				outf_MT2T << "\tlw $t1 " << (-1*offset_right) << "($fp)" << endl;
				outf_MT2T << "\tsub $t0 " << TEMP_GEN[num1] << " $t1" << endl;
			}
			else{
				if(num1 > max_temp){
					max_temp = num1;
				}
				if(num3 > max_temp){
					max_temp = num3;
				}
				outf_MT2T << "\tsub $t0 " << TEMP_GEN[num1] << " " << TEMP_GEN[num3] << endl;
			}
				
			if(str == "<"){
				outf_MT2T << "\tbltz $t0 label" << num2 << endl;
			}
			else if(str == "<="){
				outf_MT2T << "\tblez $t0 label" << num2 << endl;
			}
			else if(str == "=="){
				outf_MT2T << "\tbeqz $t0 label" << num2 << endl;
			}
			else if(str == ">"){
				outf_MT2T << "\tbgtz $t0 label" << num2 << endl;
			}
			else if(str == ">="){
				outf_MT2T << "\tbgez $t0 label" << num2 << endl;
			}
			else if(str == "!="){
				outf_MT2T << "\tbnez $t0 label" << num2 << endl;
			}
		}
		else if(str == "ret"){
			if(num3 >= 0){
				int offset = getLocation(num2);
				if(num2 > 15){
					outf_MT2T << "\tlw $s1 " << (-1*offset) << "($fp)" << endl;
				}
				else{
					if(num2 > max_temp){
						max_temp = num2;
					}
					outf_MT2T << "\tmove $s1 " << TEMP_GEN[num2] << endl;
				}
				outf_MT2T << "\tlw $t0 4($sp)" << endl;
				outf_MT2T << "\tmove $t1 $sp" << endl;
				outf_MT2T << "\tmove $sp $fp" << endl;
				outf_MT2T << "\tlw $fp 8($t1)" << endl;
				outf_MT2T << "\tjr $t0" << endl;
			}
			else{
				outf_MT2T << "\tlw $t0 4($sp)" << endl;
				outf_MT2T << "\tmove $t1 $sp" << endl;
				outf_MT2T << "\tmove $sp $fp" << endl;
				outf_MT2T << "\tlw $fp 8($t1)" << endl;
				outf_MT2T << "\tjr $t0" << endl;
			}
		}
		else if(str == "jmp"){
			int offset = getLocation(num1);
			if(num1 > 15){
				outf_MT2T << "\tlw $t0 " << (-1*offset) << "($fp)" << endl;
				if(num2<0){
					outf_MT2T << "\tbne $t0 $0 label" << num3 << endl;
				}
				else{
					outf_MT2T << "\tbeq $t0 $0 label" << num3 << endl;
				}
			}
			else{
				max_temp = num1;
				if(num2<0){
					outf_MT2T << "\tbne " <<TEMP_GEN[num1] << " $0 label" << num3 << endl;
				}
				else{
					outf_MT2T << "\tbeq " <<TEMP_GEN[num1] << " $0 label" << num3 << endl;
				}
			}
		}
		else if(str == "case"){
			int offset_left = getLocation(num1);
			outf_MT2T << "\tli $t1 " << num2 << endl;
			if(num1 > 15){
				outf_MT2T << "\tlw $t0 " << (-1*offset_left) << "($fp)" << endl;
				outf_MT2T << "\tbne $t0 $t1 label" << num3 << endl;
			}
			else{
				if(num1 > max_temp){
					max_temp = num1;
				}
				outf_MT2T << "\tbne " << TEMP_GEN[num1] << " $t1 label" << num3 << endl;
			}
		}
		else if(str == "pr"){
			int offset = getLocation(num3);
			if(num3 > 15){
				outf_MT2T << "\tlw $a0 " << (-1*offset) << "($fp)" << endl;
			}
			else{
				if(num3 > max_temp){
					max_temp = num3;
				}
				outf_MT2T << "\tmove $a0 " << TEMP_GEN[num3] << endl;
			}
			if(num2 == 0){
				outf_MT2T << "\tli $v0 1" << endl;
			}
			else{
				outf_MT2T << "\tli $v0 11" << endl;
			}
			outf_MT2T << "\tsyscall" << endl;
//			outf_MT2T << "\tla $a0 ENT" << endl;
//			outf_MT2T << "\tli $v0 4" << endl;
//			outf_MT2T << "\tsyscall" << endl;
		}
		else if(str == "endfunc"){
			if(num2 < 0){
				outf_MT2T << "\tli $v0 10" << endl;
				outf_MT2T << "\tsyscall" << endl;
				outf_MT2T << "ErrorDeal:"<< endl;
				outf_MT2T << "\tla $a0 ErrorInfor" << endl;
				outf_MT2T << "\tli $v0 4" << endl;
				outf_MT2T << "\tsyscall" << endl;
			}
			else if(num3 < 0){
				outf_MT2T << "\tj ErrorDeal" << endl;
			}
			else{
				outf_MT2T << "\tlw $t0 4($sp)" << endl;
				outf_MT2T << "\tmove $t1 $sp" << endl;
				outf_MT2T << "\tmove $sp $fp" << endl;
				outf_MT2T << "\tlw $fp 8($t1)" << endl;
				outf_MT2T << "\tjr $t0" << endl;
			}
		}
	}
}