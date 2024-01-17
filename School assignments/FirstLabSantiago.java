import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class FirstLabSantiago {
    FirstLabSantiago(){
    JFrame frame = new JFrame("Payroll");
    frame.setSize(new Dimension(1000,1000));

    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    JPanel jp1 = new JPanel();
    JPanel jp2 = new JPanel();
    JTabbedPane tp=new JTabbedPane();

    tp.add("New Payroll",jp1);
    tp.add("About",jp2);
    tp.setVisible(true);
    frame.add(tp);


jp1.setLayout(new GridLayout(19,20));
jp2.setLayout(new GridLayout(8,10));

JLabel PayP = new JLabel("Pay Period");
String month[]={"Select", "January 15th","February 15th","March 15th","April 15th","May 15th","June 15th","July 15th","August 15th","September 15th","October 15th","November 15th","December 15th"}; 
JComboBox cb = new JComboBox(month);
jp1.add(cb);
jp1.setSize(30,30);    
jp1.setVisible(true);

JLabel Earnings = new JLabel("Earnings");
Earnings.setForeground(Color.green);
Earnings.setFont(new Font("Verdana", Font.PLAIN, 24));
JLabel blank = new JLabel("");

JLabel PayNum = new JLabel("Payroll Number");
JTextField PayNum1 = new JTextField();
JLabel eID = new JLabel("Employee ID");
JTextField eID1 = new JTextField();
JLabel fName = new JLabel("Full Name");
JTextField fName1 = new JTextField();
JLabel jRank = new JLabel("Job Rank");
JLabel RperHour= new JLabel("Rate Per Hour");
JTextField RperHour1 = new JTextField("");
RperHour1.setEditable(false);
JLabel nHoursWorked= new JLabel("Number of Hours Worked");
JTextField nHoursWorked1 = new JTextField();
JLabel costOfLV = new JLabel("Cost of Living Allowance");
JTextField costOfLV1 = new JTextField("500.00");
costOfLV1.setEditable(false);
JLabel bPay = new JLabel("Basic Pay");
JTextField bPay1 = new JTextField();
bPay1.setEditable(false);
JLabel gPay = new JLabel("Gross Pay");
JTextField gPay1 = new JTextField();
gPay1.setEditable(false);

JLabel sssContri = new JLabel("SSS");
JTextField sssContri1 = new JTextField();
JLabel pHealth = new JLabel("Phil Health");
JTextField pHealth1 = new JTextField();
JLabel Tax = new JLabel("Tax");
JTextField Tax1 = new JTextField();
Tax1.setEditable(false);
JLabel tDeductions = new JLabel("Total Deductions");
JTextField tDeductions1 = new JTextField();
tDeductions1.setEditable(false);

JLabel textarea= new JLabel("This Application is about Employee Payroll");
JLabel textareas= new JLabel("Programmer: Jephunneh Deniel D. Santiago");
JLabel textaread= new JLabel("Released: February 19, 2022");


jp1.add(PayP);
jp1.add(cb);
jp1.add(Earnings);
jp1.add(blank);
jp1.add(PayNum);
jp1.add(PayNum1);
jp1.add(eID);
jp1.add(eID1);
jp1.add(fName);
jp1.add(fName1);
jp1.add(jRank);
String jRank1[]={"Select","JO1", "JO2", "JO3"}; 
JComboBox cb1 = new JComboBox(jRank1);
jp1.add(cb1);
jp1.setSize(30,30);    
jp1.setVisible(true);
jp1.add(RperHour);
jp1.add(RperHour1);
jp1.add(nHoursWorked);
jp1.add(nHoursWorked1);
jp1.add(costOfLV);
jp1.add(costOfLV1);
jp1.add(bPay);
jp1.add(bPay1);
jp1.add(gPay);
jp1.add(gPay1);


 
JLabel Deductions = new JLabel("Deductions");
Deductions.setForeground(Color.red);
Deductions.setFont(new Font("Verdana", Font.PLAIN, 24));
JLabel blank1 = new JLabel("");
jp1.add(Deductions);
jp1.add(blank1);
jp1.add(sssContri);
jp1.add(sssContri1);
jp1.add(pHealth);
jp1.add(pHealth1);
jp1.add(Tax);
jp1.add(Tax1);
jp1.add(tDeductions);
jp1.add(tDeductions1);


jp2.add(textarea);
jp2.add(textareas);
jp2.add(textaread);

JButton calcPR = new JButton("Calculate Payroll");
JButton Clear = new JButton("Clear");
JButton Close = new JButton("Close");
JTextField nPay1 = new JTextField();
JLabel nPay = new JLabel("Net Pay");
nPay1.setEditable(false);
nPay.setForeground(Color.GREEN);
nPay.setFont(new Font("Verdana", Font.PLAIN, 24));

jp1.add(nPay);
jp1.add(nPay1);
jp1.add(calcPR);
jp1.add(Clear);
jp1.add(Close, BorderLayout.WEST);



Close.addActionListener(new ActionListener() {

    @Override
    public void actionPerformed(ActionEvent e) {
        // TODO Auto-generated method stub
    System.exit(0);
    }
    
});

Clear.addActionListener(new ActionListener() {

    @Override
    public void actionPerformed(ActionEvent e) {
        PayNum1.setText("");
        eID1.setText("");
        fName1.setText("");
        RperHour1.setText("");
        nHoursWorked1.setText("");
        bPay1.setText("");
        gPay1.setText("");
        sssContri1.setText("");
        pHealth1.setText("");
        Tax1.setText("");
        tDeductions1.setText("");
        nPay1.setText("");
    }
    
});

cb1.addActionListener(new ActionListener() {

    @Override
    public void actionPerformed(ActionEvent f) {
     try {
        String jData1 = (String) cb1.getSelectedItem();
        Double jData2 = (double) 500;
        if (jData1.equals("Select")) {
            RperHour1.setText(" ");
        }
        if (jData1.equals("JO1")) {
            double dn1 = 120.00;
            double dnumber = (double) (1.25/100);
            double dn6 = Double.parseDouble(JOptionPane.showInputDialog(null, "How many hours did you work Overtime? (If you didn't over time simply put '0')"));
            double d = dnumber * dn1 * dn6;
            double dn3 = Double.parseDouble(nHoursWorked1.getText()) * dn1;
            Double dn4 = (Double) (dn3 + d + jData2);
            float numbers = 10;
            double number = 100;
            double tax1 = dn4;
            double last = numbers / number * tax1;
            bPay1.setText(Double.toString(dn3));
            RperHour1.setText(String.valueOf(dn1));
            gPay1.setText(String.valueOf(dn4));
            Tax1.setText(String.valueOf(last));
            
        }
         if (jData1.equals("JO2")) {
            double dn5 = 210.00;
            double dnumber = (double) (1.25/100);
            double dn6 = Double.parseDouble(JOptionPane.showInputDialog(null, "How many hours did you work Overtime? (If you didn't over time simply put '0')"));
            double d = dnumber * dn5 * dn6;
            double dn7 = Double.parseDouble(nHoursWorked1.getText()) * dn5;
            Double dn8 = (Double) (dn7 + d + jData2);
            float numbers = 10;
            double numbered = 100;
            double tax1 = dn8;
            double last1 = numbers / numbered * tax1;
            bPay1.setText(Double.toString(dn7));
            RperHour1.setText(String.valueOf(dn5));
            gPay1.setText(String.valueOf(dn8));
            Tax1.setText(String.valueOf(last1));
        }
        if (jData1.equals("JO3")) {
            double dn9 = 310.00;
            double dnumbers = (double) (1.25/100);
            double dn10 = Double.parseDouble(JOptionPane.showInputDialog(null, "How many hours did you work Overtime? (If you didn't over time simply put '0')"));
            double d = dnumbers * dn9 * dn10;
            double dn11 = Double.parseDouble(nHoursWorked1.getText()) * dn9;
            Double dn12 = (Double) (dn11 + d + jData2);
            float  fnum = 10;
            double fnumber = 100;
            double tax1 = dn12;
            double last2 = fnum / fnumber * tax1;
            bPay1.setText(Double.toString(dn11));
            RperHour1.setText(String.valueOf(dn9));
            gPay1.setText(String.valueOf(dn12));
            Tax1.setText(String.valueOf(last2));
        }

     } catch (Exception e) {
        System.out.println("Exception: " + e);
     }
    }
    
});

calcPR.addActionListener(new ActionListener() {

    @Override
    public void actionPerformed(ActionEvent f){
       try {
        double totalD = Double.parseDouble(sssContri1.getText());
        double totalD2 = Double.parseDouble(pHealth1.getText());
        double totalD3 = Double.parseDouble(Tax1.getText());
        double totalD4 = totalD + totalD2 + totalD3;
        tDeductions1.setText(Double.toString(totalD4));
        double nPays = Double.parseDouble(gPay1.getText());
        double nPae = nPays - totalD4;
        nPay1.setText(String.valueOf(nPae));
       } catch (Exception e) {
        System.out.println("Exception: " + e);
       }
  
    }
    
});

frame.setVisible(true);
}
           public static void main(String[] args) {

        new FirstLabSantiago();
           }
}
