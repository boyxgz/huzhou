/**
 * 
 */
package com.surelution.huzhou.utils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import com.surelution.huzhou.TempQrEvent2016EarlySummber;

/**
 * @author <a href="mailto:guangzong.syu@gmail.com">guagnzong</a>
 *
 */
public class CardGenerator {
	
		private static final String TEMPLATE_PATH = "/Users/johnny/huzhou_cards/template.png";
		private static final String QR_BASE_PATH = "/Users/johnny/temp_qr/";
		private static final String ICON_PATH = "/Users/johnny/huzhou_cards/icon.jpg";
		private static final String DEST_PATH = "/Users/johnny/huzhou_cards/";
	
		private static final int PAGE_WIDTH = 2480;
		private static final int PAGE_HEIGHT = 3508;
		private static final int PAGE_LEFT_MARGIN = 0;
		private static final int PAGE_TOP_MARGIN = 90;
		private static final int CARD_WIDTH = 1200;
		private static final int CARD_HEIGHT = 920;
		private static final int CARD_LEFT_MARGIN = 40;
		private static final int CARD_TOP_MARGIN = 30;
		private static final int QR_LEFT = 90;
		private static final int QR_TOP = 360;
		private static final int QR_WIDTH = 400;
		private static final int ICON_LEFT = 250;
		private static final int ICON_TOP = 530;
		private static final int ICON_WIDTH = 70;
		private static final int ID_LEFT = 800;
		private static final int ID_TOP = 160;
		
		private static BufferedImage loadTemplate() throws Exception {
			BufferedImage template = ImageIO.read(new File(TEMPLATE_PATH));
			return template;
		}
		
		private static BufferedImage loadIcon() throws Exception {
			BufferedImage template = ImageIO.read(new File(ICON_PATH));
			return template;
		}
	
		public static void main(String[] args) throws Exception {
			for(int i = 0; i < 101 / 6; i++) {
				compositePage(6 * i + 1, 6 * i + 7, i);
			}
		}
	
		public static void compositePage(int from, int to, int fileId) throws Exception {
			BufferedImage combined = new BufferedImage(PAGE_WIDTH,
					PAGE_HEIGHT, BufferedImage.TYPE_INT_RGB);
			Graphics g = combined.getGraphics();
			g.setColor(Color.WHITE);
			g.fillRect(0, 0, PAGE_WIDTH, PAGE_HEIGHT);
			for(int i = 0; i < to - from; i++) {
				int row = i / 2;
				int col = i % 2;
				g.drawImage(compositeUnit(from + i),
						PAGE_LEFT_MARGIN + col * CARD_WIDTH,
						PAGE_TOP_MARGIN + row * CARD_HEIGHT,
						CARD_WIDTH, CARD_HEIGHT,
						null);
			}
	
			OutputStream os = new FileOutputStream(new File(DEST_PATH + fileId + ".jpg"));
			ImageIO.write(combined, "jpg", os);
			os.close();
		}
	
		private static BufferedImage compositeUnit(int id) throws Exception {
			BufferedImage combined = new BufferedImage(CARD_WIDTH,
					CARD_HEIGHT, BufferedImage.TYPE_INT_RGB);
			BufferedImage template = loadTemplate();
			
			BufferedImage qr = ImageIO.read(new File(QR_BASE_PATH + TempQrEvent2016EarlySummber.get(id).qrKey + ".jpg"));
			BufferedImage icon = loadIcon();
			Graphics g = combined.getGraphics();
			g.setColor(Color.WHITE);
			g.fillRect(0, 0, CARD_WIDTH, CARD_HEIGHT);
			g.drawImage(template, CARD_LEFT_MARGIN, CARD_TOP_MARGIN,
					CARD_WIDTH - 2 * CARD_LEFT_MARGIN,
					CARD_HEIGHT - 2 * CARD_TOP_MARGIN, null);
			g.drawImage(qr, QR_LEFT, QR_TOP, QR_WIDTH, QR_WIDTH, null);
			g.drawImage(icon, ICON_LEFT, ICON_TOP, ICON_WIDTH, ICON_WIDTH, null);
			g.setColor(Color.BLACK);
			Font f = new Font("Dialog", Font.PLAIN, 26);
			g.setFont(f);
			g.drawString("SN:" + String.valueOf(id), ID_LEFT, ID_TOP);
			return combined;
		}
	
}
