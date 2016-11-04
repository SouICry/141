import java.io.*;
import java.util.*;

public class Assembler {
  private static HashMap<String, Integer> hashmap = new HashMap<>();
  private static int pc = 0; // program counter used to calculate branch labels

  public static void main(String args[]) {

    try {
      // initialize input
      String sourceFile = args[0];
      FileReader fileReader = new FileReader(sourceFile);
      BufferedReader input = new BufferedReader(fileReader);
      
      // initialize output
      String destFile = args[1];
      FileWriter fileWriter = new FileWriter(destFile);
      BufferedWriter output = new BufferedWriter(fileWriter);

      // read and load labels into hashmaps
      String code = "";
      String line;
      while((line = input.readLine()) != null) {
        if(line.contains(":")) {
          hashmap.put(line.substring(0, line.length()-1).toLowerCase(), pc);
        }
        else {
          code += line + "\n";
        }
        pc++;
      }
      
      pc = 0;

      // split the instructions into an array and compile each
      String instructions[] = code.split("\n");
      System.out.println(instructions.length);
      for (int i = 0; i < instructions.length; i++) {
          output.write(convert(instructions[i]) + "\n");
      }

      output.close();
      input.close();
    }
    catch (IOException ex) {
      System.out.println("Exception");
    }
  }

  // compile method that takes a instruction and returns a binary string
  public static String convert(String source) {
    String binString = ""; // the return binary string
    // parsing and separating the instructions into arguments
    source = source.toLowerCase();
    String inst[] = source.split(" ");
    String offset; // used to calculate branch offset for label

    int reg1, reg2, immediate;
    switch (inst[0]) {
      case "decrementandbranchifnotzero" :
        binString += "000";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
        immediate = pc - hashmap.get(inst[2]);
        offset = toBinString(immediate, 3);
        binString += offset.substring(offset.length()-3, offset.length());
      break;
      case "loadandabsdiff" :
        binString += "001";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        reg2 = Integer.parseInt(inst[2].substring(1,2));
        binString += toBinString(reg1, 3);
        binString += toBinString(reg2, 3);
      break;
      case "bn" :
        binString += "010";
        immediate = pc - hashmap.get(inst[1]);
        offset = toBinString(immediate, 6);
        binString += offset.substring(offset.length()-6, offset.length());
      break;
      case "copy" :
        binString += "011";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        reg2 = Integer.parseInt(inst[2].substring(1,2));
        binString += toBinString(reg1, 3);
        binString += toBinString(reg2, 3);
      break;
      case "lsr1" :
        binString += "100000000";
      break;
      case "memoffset" :
        binString += "100001000";
      break;
      case "halt" :
        binString += "100010000";
      break;
      case "loadimmonelslminusone" :
        binString += "101000";
        immediate = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(immediate, 3);
      break;
      case "store" :
        binString += "101001";
        immediate = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(immediate, 3);
      break;
      case "loadfromaddress" :
        binString += "101010";
        immediate = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(immediate, 3);
      break;
      case "loadimmonelsl" :
        binString += "101100";
        immediate = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(immediate, 3);
      break;
      case "loadimm" :
        binString += "101101";
        immediate = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(immediate, 3);
      break;
      case "load" :
        binString += "110000";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "loadandsetstringmatchr2" :
        binString += "110001";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "clear" :
        binString += "110010";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "addto" :
        binString += "110011";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "incrementifset" :
        binString += "110100";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "setisnegative" :
        binString += "110101";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "leftshift1" :
        binString += "110110";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "writeminto" :
        binString += "110111";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "decrementandsetisone" :
        binString += "111000";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "decrement" :
        binString += "111001";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "storepcplustwo" :
        binString += "111010";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      case "return" :
        binString += "111011";
        reg1 = Integer.parseInt(inst[1].substring(1,2));
        binString += toBinString(reg1, 3);
      break;
      default :
        System.out.println("compile error: " + inst[0] + " instruction does not exit");
      break;
    }
    return binString;
  }

  // instruction to convert interger into binary string with a specific width
  public static String toBinString(int data, int width) {
    return String.format("%" + width + "s", Integer.toBinaryString(data)).replace(' ', '0');
  }

}
