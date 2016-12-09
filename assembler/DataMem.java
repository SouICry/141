import java.util.*;
import java.io.*;

public class DataMem {
  public static void main(String args[]) {
    try {

      // initialize input
      String problem1 = args[0];
      FileReader fileReader1 = new FileReader(problem1);
      BufferedReader input1 = new BufferedReader(fileReader1);
      
      String problem2 = args[1];
      FileReader fileReader2 = new FileReader(problem2);
      BufferedReader input2 = new BufferedReader(fileReader2);
      
      String problem3 = args[2];
      FileReader fileReader3 = new FileReader(problem3);
      BufferedReader input3 = new BufferedReader(fileReader3);

      // initialize output
      String destFile = args[3];
      FileWriter fileWriter = new FileWriter(destFile);
      BufferedWriter output = new BufferedWriter(fileWriter);

      int[] outputList = new int[256];
      Arrays.fill(outputList, 0);
      String line;

      for(int i = 1; i <= 3; i++) {
        line = input1.readLine();
        outputList[i] = Integer.parseInt(line);
      }
	  
	  
	line = input2.readLine();
	outputList[6] = Integer.parseInt(line);
	  
	line = input2.readLine();
      for(int i = 32; i < 32 + 64; i++) {
        line = input2.readLine();
        outputList[i] = Integer.parseInt(line);
      }
      for(int i = 128; i < 128 + 20; i++) {
        line = input3.readLine();
        outputList[i] = Integer.parseInt(line);
      }

      for(int i = 0; i < 256; i++) {
        writeNum(output, outputList[i]);
      }

      input1.close();
      input2.close();
      input3.close();
      output.close();
    }
    catch (IOException ex) {
      System.out.println("Exception");
    }
  }
  public static String toBinString(int data, int width) {
      return String.format("%" + width + "s", Integer.toBinaryString(data)).replace(' ', '0');
  }
  public static void writeNum(BufferedWriter output, int value) {
    String bin = toBinString(value, 8);
    bin = bin.substring(bin.length() - 8, bin.length());
    try {
      output.write(bin + "\n");
    }
    catch (IOException ex) {
      System.out.println("Exception");
    }
  }
}
