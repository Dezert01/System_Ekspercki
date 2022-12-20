import java.io.*;
import java.net.URI;
import java.net.URL;
import java.util.Arrays;
import java.util.Observable;
import java.util.Observer;
import jclips.JClips;
import java.awt.*;
import javax.swing.*;
import javax.swing.UIManager;
import javax.swing.border.LineBorder;

public class netflix extends JFrame implements Observer {

	private static final String knowledgeBase = "netflixdemo.clp";
	public static netflix observer;
	public static JClips jClips;

	static String[] myArray = new String[12]; // za³ó¿my, ¿e maksymalnie mo¿e byæ 10 odpowiedzi
	static String[] answersArray = new String[10];
	static int i; 
	
	public Color frameBackground = new Color(100, 100, 100);
	public Color buttonBackground = new Color(150, 150, 150);
	public Color buttonSelectBackground = new Color(180, 180, 180);
	public Color textColor = new Color(230, 230, 230);
	
	static ImageIcon icon = new ImageIcon("src/netflix_icon.png");
	static Image img = icon.getImage();
	static Image newimg = img.getScaledInstance(30, 30, java.awt.Image.SCALE_SMOOTH);
	static ImageIcon scaledicon = new ImageIcon(newimg);
	
	static UIManager UI = new UIManager();
	
	public void update(Observable jClips, Object msg) {
		String _msg = (String) msg;
		myArray = _msg.split(";");
		answersArray = Arrays.copyOfRange(myArray, 1, myArray.length-1);
		i = answersArray.length;
		
		int answerButton = JOptionPane.showOptionDialog(null, myArray[0], "Netflix - What Movie to Watch?", 
				JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE, scaledicon, answersArray, null);;
		
		for(int j = 0; j < i; j++) {
			if (answerButton == j) {
				if (answersArray[answerButton].equals("Start") && i == 1) {
					netflix.jClips.executeCommand("(assert (" + myArray[myArray.length - 1] + "))");
					netflix.jClips.run();
				} else if (answersArray[answerButton].equals("Exit") && i == 1) {
					netflix.jClips.deallocate();
					System.exit(0);
				} else {
					netflix.jClips.executeCommand("(assert (" + myArray[myArray.length - 1] + " "
							+ answersArray[answerButton] + "))");
					netflix.jClips.run();
				}
			}
		}
	}

	public netflix() {
		jClips = JClips.getInstance();
		UI.put("OptionPane.background", frameBackground);
		UI.put("Panel.background", frameBackground);
		UI.put("OptionPane.messageForeground", textColor);
		UI.put("Button.background", buttonBackground);
		UI.put("Button.foreground", textColor);
		UI.put("Button.rollover", false);;
		UI.put("Button.select", buttonSelectBackground);
		UI.put("Button.focus", new Color(0, 0, 0, 0));
		UI.put("Button.border", new LineBorder(new Color(0, 0, 0, 0), 5));
	}

	public static void main(String[] args) {
		
		javax.swing.SwingUtilities.invokeLater(new Runnable() {
			public void run() {
				observer = new netflix();
				jClips.addObserver(observer);
				jClips.init();

				try {
					URL urlFile = netflix.class.getResource(knowledgeBase);
					if (urlFile == null) {
						throw new FileNotFoundException(knowledgeBase);
					}
					File file = new File(new URI(urlFile.toString()));
					jClips.load(file.getPath());
					jClips.reset();
					jClips.run();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		});
	}
}