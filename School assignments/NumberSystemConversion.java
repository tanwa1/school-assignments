import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class NumberSystemConversion {
    public static void main(String[] args) {
        JFrame frame = new JFrame("CONVERSION");
        frame.setSize(new Dimension(600, 600));
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel panelOne = new JPanel();
        panelOne.setLayout(new GridLayout(5, 30));

        JLabel numberSystem = new JLabel("Select Number System: ");
        String numberSystemA[] = {"Binary", "Decimal", "Hexadecimal", "Octal"};
        JComboBox<String> Combo = new JComboBox<>(numberSystemA);
        JLabel enterValue = new JLabel("Enter Value: ");
        JLabel blankValue = new JLabel();
        JTextField enterValue1 = new JTextField("Type Desired 'Binary' Here");
        JTextField enterValue2 = new JTextField("10 " + "Decimal");
        enterValue2.setEditable(false);
        JTextField enterValue3 = new JTextField("16 " + "Hexadecimal");
        enterValue3.setEditable(false);
        JTextField enterValue4 = new JTextField("8 " + "Octal");
        enterValue4.setEditable(false);

        Combo.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String selectedNumberSystem = (String) Combo.getSelectedItem();
                switch (selectedNumberSystem) {
                    case "Decimal":
                        enterValue1.setText("Type Desired 'Decimal' Here");
                        enterValue2.setText(  "Binary");
                        enterValue3.setText("Hexadecimal");
                        enterValue4.setText("Octal");
                        break;
                    case "Hexadecimal":
                        enterValue1.setText("Type Desired 'Hexadecimal' Here");
                        enterValue2.setText("Decimal");
                        enterValue3.setText("Binary");
                        break;
                    case "Octal":
                        enterValue1.setText("Type Desired 'Octal' Here");
                        enterValue3.setText("Hexadecimal");
                        enterValue4.setText("Binary");
                        break;
                    default:
                        enterValue1.setText("Type Desired Binary Here");
                        enterValue2.setText("Decimal");
                        enterValue3.setText("Hexadecimal");
                        enterValue4.setText("Octal");

                }
            }
        });

        JButton convertButton = new JButton("Convert");
        convertButton.setPreferredSize(new Dimension(200, 30));

        panelOne.add(numberSystem);
        panelOne.add(Combo);
        panelOne.add(enterValue);
        panelOne.add(blankValue);
        panelOne.add(enterValue1);
        panelOne.add(enterValue2);
        panelOne.add(enterValue3);
        panelOne.add(enterValue4);
        panelOne.add(convertButton);

        frame.add(panelOne);

        convertButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String selectedNumberSystem = (String) Combo.getSelectedItem();

                switch (selectedNumberSystem) {
                    case "Binary":
                        String binaryString = enterValue1.getText();
                        long decimalValue = Long.parseLong(binaryString, 2);

                        enterValue2.setText(decimalValue + " Decimal");

                        String hexadecimalString = Long.toHexString(decimalValue).toUpperCase();
                        enterValue3.setText(hexadecimalString + " Hexadecimal");

                        String binaryRepresentation = Long.toBinaryString(decimalValue);
                        String octalString = Long.toOctalString(Long.parseLong(binaryRepresentation, 2));
                        enterValue4.setText(octalString + " Octal");

                        break;

                    case "Decimal":
                        String decimalString = enterValue1.getText();

                        long decimalValue1 = Long.parseLong(decimalString);

                        enterValue2.setText(Long.toBinaryString(decimalValue1) + " Binary");

                        long binaryValue = decimalValue1;

                        String binaryValue1 = Long.toHexString(binaryValue);

                        enterValue3.setText(binaryValue1.toUpperCase() + " Hexadecimal");

                        String hexaDecimalValue = binaryValue1;

                        long hexaDecimalValue1 = Long.parseLong(hexaDecimalValue, 16);

                        enterValue4.setText(Long.toOctalString(hexaDecimalValue1) + " Octal");

                        break;
                    case "Hexadecimal":
                        String HexaDecimalString = enterValue1.getText();

                        long HexaDecimalValue = Long.parseLong(HexaDecimalString, 16);

                        enterValue3.setText(Long.toBinaryString(HexaDecimalValue) + " Binary");
                        String binaryValues = Long.toBinaryString(HexaDecimalValue);

                        long decimalValues = Long.parseLong(binaryValues, 2);
                        enterValue2.setText(decimalValues + " Decimal");

                        long decimalValue2 = HexaDecimalValue;

                        enterValue4.setText(Long.toOctalString(decimalValue2) + " Octal");

                        break;
                    case "Octal":
                        String OctalValue = enterValue1.getText();

                        long OctalNumber = Long.parseLong(OctalValue, 8);

                        enterValue2.setText(OctalNumber + " Decimal");

                        String DecimalValue2 = String.valueOf(OctalNumber);

                        long BinaryValue2 = Long.parseLong(Long.toBinaryString(Long.parseLong(DecimalValue2)));

                        enterValue4.setText(BinaryValue2 + " Binary");

                        String BinaryValue3 = String.valueOf(BinaryValue2);

                        String HexaDecimalValue3 = Long.toHexString(Long.parseLong(BinaryValue3, 2));

                        enterValue3.setText(HexaDecimalValue3.toUpperCase() + " Hexadecimal");

                        break;
                }
            }
        });

        frame.pack();
        frame.setVisible(true);
    }
}
