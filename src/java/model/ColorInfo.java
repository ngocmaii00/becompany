/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author zeryus
 */
public class ColorInfo {
    private String name;
    private String hex;
    private int red, green, blue;
    
    private static final Map<String,ColorInfo> COLOR_MAP = new HashMap();
    static{
        COLOR_MAP.put("AliceBlue", new ColorInfo("#F0F8FF", 240, 248, 255));
        COLOR_MAP.put("AntiqueWhite", new ColorInfo("#FAEBD7", 250, 235, 215));
        COLOR_MAP.put("Aqua", new ColorInfo("#00FFFF", 0, 255, 255));
        COLOR_MAP.put("Aquamarine", new ColorInfo("#7FFFD4", 127, 255, 212));
        COLOR_MAP.put("Azure", new ColorInfo("#F0FFFF", 240, 255, 255));
        COLOR_MAP.put("Beige", new ColorInfo("#F5F5DC", 245, 245, 220));
        COLOR_MAP.put("Bisque", new ColorInfo("#FFE4C4", 255, 228, 196));
        COLOR_MAP.put("Black", new ColorInfo("#000000", 0, 0, 0));
        COLOR_MAP.put("BlanchedAlmond", new ColorInfo("#FFEBCD", 255, 235, 205));
        COLOR_MAP.put("Blue", new ColorInfo("#0000FF", 0, 0, 255));
        COLOR_MAP.put("BlueViolet", new ColorInfo("#8A2BE2", 138, 43, 226));
        COLOR_MAP.put("Brown", new ColorInfo("#A52A2A", 165, 42, 42));
        COLOR_MAP.put("Burlywood", new ColorInfo("#DEB887", 222, 184, 135));
        COLOR_MAP.put("CadetBlue", new ColorInfo("#5F9EA0", 95, 158, 160));
        COLOR_MAP.put("Chartreuse", new ColorInfo("#7FFF00", 127, 255, 0));
        COLOR_MAP.put("Chocolate", new ColorInfo("#D2691E", 210, 105, 30));
        COLOR_MAP.put("Coral", new ColorInfo("#FF7F50", 255, 127, 80));
        COLOR_MAP.put("CornflowerBlue", new ColorInfo("#6495ED", 100, 149, 237));
        COLOR_MAP.put("Cornsilk", new ColorInfo("#FFF8DC", 255, 248, 220));
        COLOR_MAP.put("Crimson", new ColorInfo("#DC143C", 220, 20, 60));
        COLOR_MAP.put("Cultured", new ColorInfo("#F5F5F5", 245, 245, 245));
        COLOR_MAP.put("DarkBlue", new ColorInfo("#00008B", 0, 0, 139));
        COLOR_MAP.put("DarkCyan", new ColorInfo("#008B8B", 0, 139, 139));
        COLOR_MAP.put("DarkGoldenrod", new ColorInfo("#B8860B", 184, 134, 11));
        COLOR_MAP.put("DarkGray", new ColorInfo("#A9A9A9", 169, 169, 169));
        COLOR_MAP.put("DarkGreen", new ColorInfo("#006400", 0, 100, 0));
        COLOR_MAP.put("DarkKhaki", new ColorInfo("#BDB76B", 189, 183, 107));
        COLOR_MAP.put("DarkMagenta", new ColorInfo("#8B008B", 139, 0, 139));
        COLOR_MAP.put("DarkOliveGreen", new ColorInfo("#556B2F", 85, 107, 47));
        COLOR_MAP.put("DarkOrange", new ColorInfo("#FF8C00", 255, 140, 0));
        COLOR_MAP.put("DarkOrchid", new ColorInfo("#9932CC", 153, 50, 204));
        COLOR_MAP.put("DarkRed", new ColorInfo("#8B0000", 139, 0, 0));
        COLOR_MAP.put("DarkSalmon", new ColorInfo("#E9967A", 233, 150, 122));
        COLOR_MAP.put("DarkSeaGreen", new ColorInfo("#8FBC8F", 143, 188, 143));
        COLOR_MAP.put("DarkSlateBlue", new ColorInfo("#483D8B", 72, 61, 139));
        COLOR_MAP.put("DarkSlateGray", new ColorInfo("#2F4F4F", 47, 79, 79));
        COLOR_MAP.put("DarkTurquoise", new ColorInfo("#00CED1", 0, 206, 209));
        COLOR_MAP.put("DarkViolet", new ColorInfo("#9400D3", 148, 0, 211));
        COLOR_MAP.put("DeepPink", new ColorInfo("#FF1493", 255, 20, 147));
        COLOR_MAP.put("DeepSkyBlue", new ColorInfo("#00BFFF", 0, 191, 255));
        COLOR_MAP.put("DimGray", new ColorInfo("#696969", 105, 105, 105));
        COLOR_MAP.put("DodgerBlue", new ColorInfo("#1E90FF", 30, 144, 255));
        COLOR_MAP.put("FireBrick", new ColorInfo("#B22222", 178, 34, 34));
        COLOR_MAP.put("FloralWhite", new ColorInfo("#FFFAF0", 255, 250, 240));
        COLOR_MAP.put("ForestGreen", new ColorInfo("#228B22", 34, 139, 34));
        COLOR_MAP.put("Fuchsia", new ColorInfo("#FF00FF", 255, 0, 255));
        COLOR_MAP.put("Gainsboro", new ColorInfo("#DCDCDC", 220, 220, 220));
        COLOR_MAP.put("GhostWhite", new ColorInfo("#F8F8FF", 248, 248, 255));
        COLOR_MAP.put("Gold", new ColorInfo("#FFD700", 255, 215, 0));
        COLOR_MAP.put("Goldenrod", new ColorInfo("#DAA520", 218, 165, 32));
        COLOR_MAP.put("Gray", new ColorInfo("#808080", 128, 128, 128));
        COLOR_MAP.put("Green", new ColorInfo("#008000", 0, 128, 0));
        COLOR_MAP.put("GreenYellow", new ColorInfo("#ADFF2F", 173, 255, 47));
        COLOR_MAP.put("HoneyDew", new ColorInfo("#F0FFF0", 240, 255, 240));
        COLOR_MAP.put("HotPink", new ColorInfo("#FF69B4", 255, 105, 180));
        COLOR_MAP.put("IndianRed", new ColorInfo("#CD5C5C", 205, 92, 92));
        COLOR_MAP.put("Indigo", new ColorInfo("#4B0082", 75, 0, 130));
        COLOR_MAP.put("Ivory", new ColorInfo("#FFFFF0", 255, 255, 240));
        COLOR_MAP.put("Khaki", new ColorInfo("#F0E68C", 240, 230, 140));
        COLOR_MAP.put("Lavender", new ColorInfo("#E6E6FA", 230, 230, 250));
        COLOR_MAP.put("LavenderBlush", new ColorInfo("#FFF0F5", 255, 240, 245));
        COLOR_MAP.put("LawnGreen", new ColorInfo("#7CFC00", 124, 252, 0));
        COLOR_MAP.put("LemonChiffon", new ColorInfo("#FFFACD", 255, 250, 205));
        COLOR_MAP.put("LightBlue", new ColorInfo("#ADD8E6", 173, 216, 230));
        COLOR_MAP.put("LightCoral", new ColorInfo("#F08080", 240, 128, 128));
        COLOR_MAP.put("LightCyan", new ColorInfo("#E0FFFF", 224, 255, 255));
        COLOR_MAP.put("LightGoldenrodYellow", new ColorInfo("#FAFAD2", 250, 250, 210));
        COLOR_MAP.put("LightGray", new ColorInfo("#D3D3D3", 211, 211, 211));
        COLOR_MAP.put("LightGreen", new ColorInfo("#90EE90", 144, 238, 144));
        COLOR_MAP.put("LightPink", new ColorInfo("#FFB6C1", 255, 182, 193));
        COLOR_MAP.put("LightSalmon", new ColorInfo("#FFA07A", 255, 160, 122));
        COLOR_MAP.put("LightSeaGreen", new ColorInfo("#20B2AA", 32, 178, 170));
        COLOR_MAP.put("LightSkyBlue", new ColorInfo("#87CEFA", 135, 206, 250));
        COLOR_MAP.put("LightSlateGray", new ColorInfo("#778899", 119, 136, 153));
        COLOR_MAP.put("LightSteelBlue", new ColorInfo("#B0C4DE", 176, 196, 222));
        COLOR_MAP.put("LightYellow", new ColorInfo("#FFFFE0", 255, 255, 224));
        COLOR_MAP.put("Lime", new ColorInfo("#00FF00", 0, 255, 0));
        COLOR_MAP.put("LimeGreen", new ColorInfo("#32CD32", 50, 205, 50));
        COLOR_MAP.put("Linen", new ColorInfo("#FAF0E6", 250, 240, 230));
        COLOR_MAP.put("Magenta", new ColorInfo("#FF00FF", 255, 0, 255));
        COLOR_MAP.put("Maroon", new ColorInfo("#800000", 128, 0, 0));
        COLOR_MAP.put("MediumAquaMarine", new ColorInfo("#66CDAA", 102, 205, 170));
        COLOR_MAP.put("MediumBlue", new ColorInfo("#0000CD", 0, 0, 205));
        COLOR_MAP.put("MediumOrchid", new ColorInfo("#BA55D3", 186, 85, 211));
        COLOR_MAP.put("MediumPurple", new ColorInfo("#9370DB", 147, 112, 219));
        COLOR_MAP.put("MediumSeaGreen", new ColorInfo("#3CB371", 60, 179, 113));
        COLOR_MAP.put("MediumSlateBlue", new ColorInfo("#7B68EE", 123, 104, 238));
        COLOR_MAP.put("MediumSpringGreen", new ColorInfo("#00FA9A", 0, 250, 154));
        COLOR_MAP.put("MediumTurquoise", new ColorInfo("#48D1CC", 72, 209, 204));
        COLOR_MAP.put("MediumVioletRed", new ColorInfo("#C71585", 199, 21, 133));
        COLOR_MAP.put("MidnightBlue", new ColorInfo("#191970", 25, 25, 112));
        COLOR_MAP.put("MintCream", new ColorInfo("#F5FFFA", 245, 255, 250));
        COLOR_MAP.put("MistyRose", new ColorInfo("#FFE4E1", 255, 228, 225));
        COLOR_MAP.put("Moccasin", new ColorInfo("#FFE4B5", 255, 228, 181));
        COLOR_MAP.put("NavajoWhite", new ColorInfo("#FFDEAD", 255, 222, 173));
        COLOR_MAP.put("Navy", new ColorInfo("#000080", 0, 0, 128));
        COLOR_MAP.put("OldLace", new ColorInfo("#FDF5E6", 253, 245, 230));
        COLOR_MAP.put("Olive", new ColorInfo("#808000", 128, 128, 0));
        COLOR_MAP.put("OliveDrab", new ColorInfo("#6B8E23", 107, 142, 35));
        COLOR_MAP.put("Orange", new ColorInfo("#FFA500", 255, 165, 0));
        COLOR_MAP.put("OrangeRed", new ColorInfo("#FF4500", 255, 69, 0));
        COLOR_MAP.put("Orchid", new ColorInfo("#DA70D6", 218, 112, 214));
        COLOR_MAP.put("PaleGoldenrod", new ColorInfo("#EEE8AA", 238, 232, 170));
        COLOR_MAP.put("PaleGreen", new ColorInfo("#98FB98", 152, 251, 152));
        COLOR_MAP.put("PaleTurquoise", new ColorInfo("#AFEEEE", 175, 238, 238));
        COLOR_MAP.put("PaleVioletRed", new ColorInfo("#DB7093", 219, 112, 147));
        COLOR_MAP.put("PapayaWhip", new ColorInfo("#FFEFD5", 255, 239, 213));
        COLOR_MAP.put("PeachPuff", new ColorInfo("#FFDAB9", 255, 218, 185));
        COLOR_MAP.put("Peru", new ColorInfo("#CD853F", 205, 133, 63));
        COLOR_MAP.put("Pink", new ColorInfo("#FFC0CB", 255, 192, 203));
        COLOR_MAP.put("Plum", new ColorInfo("#DDA0DD", 221, 160, 221));
        COLOR_MAP.put("PowderBlue", new ColorInfo("#B0E0E6", 176, 224, 230));
        COLOR_MAP.put("Purple", new ColorInfo("#800080", 128, 0, 128));
        COLOR_MAP.put("Red", new ColorInfo("#FF0000", 255, 0, 0));
        COLOR_MAP.put("RosyBrown", new ColorInfo("#BC8F8F", 188, 143, 143));
        COLOR_MAP.put("RoyalBlue", new ColorInfo("#4169E1", 65, 105, 225));
        COLOR_MAP.put("SaddleBrown", new ColorInfo("#8B4513", 139, 69, 19));
        COLOR_MAP.put("Salmon", new ColorInfo("#FA8072", 250, 128, 114));
        COLOR_MAP.put("SandyBrown", new ColorInfo("#F4A460", 244, 164, 96));
        COLOR_MAP.put("SeaGreen", new ColorInfo("#2E8B57", 46, 139, 87));
        COLOR_MAP.put("Seashell", new ColorInfo("#FFF5EE", 255, 245, 238));
        COLOR_MAP.put("Sienna", new ColorInfo("#A0522D", 160, 82, 45));
        COLOR_MAP.put("Silver", new ColorInfo("#C0C0C0", 192, 192, 192));
        COLOR_MAP.put("SkyBlue", new ColorInfo("#87CEEB", 135, 206, 235));
        COLOR_MAP.put("SlateBlue", new ColorInfo("#6A5ACD", 106, 90, 205));
        COLOR_MAP.put("SlateGray", new ColorInfo("#708090", 112, 128, 144));
        COLOR_MAP.put("Snow", new ColorInfo("#FFFAFA", 255, 250, 250));
        COLOR_MAP.put("SpringGreen", new ColorInfo("#00FF7F", 0, 255, 127));
        COLOR_MAP.put("SteelBlue", new ColorInfo("#4682B4", 70, 130, 180));
        COLOR_MAP.put("Tan", new ColorInfo("#D2B48C", 210, 180, 140));
        COLOR_MAP.put("Teal", new ColorInfo("#008080", 0, 128, 128));
        COLOR_MAP.put("Thistle", new ColorInfo("#D8BFD8", 216, 191, 216));
        COLOR_MAP.put("Tomato", new ColorInfo("#FF6347", 255, 99, 71));
        
        COLOR_MAP.put("Turquoise", new ColorInfo("#40E0D0", 64, 224, 208));
        COLOR_MAP.put("Violet", new ColorInfo("#EE82EE", 238, 130, 238));
        COLOR_MAP.put("Wheat", new ColorInfo("#F5DEB3", 245, 222, 179));
        COLOR_MAP.put("White", new ColorInfo("#FFFFFF", 255, 255, 255));
        COLOR_MAP.put("WhiteSmoke", new ColorInfo("#F5F5F5", 245, 245, 245));
        COLOR_MAP.put("Yellow", new ColorInfo("#FFFF00", 255, 255, 0));
        COLOR_MAP.put("YellowGreen", new ColorInfo("#9ACD32", 154, 205, 50));  
    };
    
    public ColorInfo(){
        
    }
         
    public ColorInfo(String hex, int red, int green, int blue){
       
        this.hex = hex.replace("#", "").trim();
        this.red = red;
        this.green = green;
        this.blue = blue;
    }
    
    public static ColorInfo getColorByName(String name){
        
            return COLOR_MAP.get(name);
    }
    
    public ColorInfo setHex(String hex){
        this.hex = hex.replace(",", "").trim();
        String rawRed = hex.substring(0, 2);
        String rawGreen = hex.substring(2,4);
        String rawBlue = hex.substring(4,6);
        this.red = Integer.parseInt(rawRed,16);
        this.green = Integer.parseInt(rawGreen,16);
        this.blue = Integer.parseInt(rawBlue,16);
        
        return this;
    }

    public String getHex() {
        return hex;
    }
    
    public int getRed() {
        return red;
    }

    public int getGreen() {
        return green;
    }

    public int getBlue() {
        return blue;
    }
    public boolean isLightColor(){
        if(this.red > 241 && this.green > 241 && this.blue >241)
            return true;
        return false;
    }
    
}
