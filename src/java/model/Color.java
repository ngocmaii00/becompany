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
public class Color {
   
    public static final Map<String ,ColorInfo> COLOR_MAP = new HashMap();
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
            COLOR_MAP.put("BurlyWood", new ColorInfo("#DEB887", 222, 184, 135));
            COLOR_MAP.put("CadetBlue", new ColorInfo("#5F9EA0", 95, 158, 160));
            COLOR_MAP.put("Chartreuse", new ColorInfo("#7FFF00", 127, 255, 0));
            COLOR_MAP.put("Chocolate", new ColorInfo("#D2691E", 210, 105, 30));
            COLOR_MAP.put("Coral", new ColorInfo("#FF7F50", 255, 127, 80));
            COLOR_MAP.put("CornflowerBlue", new ColorInfo("#6495ED", 100, 149, 237));
            COLOR_MAP.put("Cornsilk", new ColorInfo("#FFF8DC", 255, 248, 220));
            COLOR_MAP.put("Crimson", new ColorInfo("#DC143C", 220, 20, 60));
            COLOR_MAP.put("Cyan", new ColorInfo("#00FFFF", 0, 255, 255));
            COLOR_MAP.put("DarkBlue", new ColorInfo("#00008B", 0, 0, 139));
            COLOR_MAP.put("DarkCyan", new ColorInfo("#008B8B", 0, 139, 139));
            COLOR_MAP.put("DarkGoldenRod", new ColorInfo("#B8860B", 184, 134, 11));
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
            COLOR_MAP.put("GoldenRod", new ColorInfo("#DAA520", 218, 165, 32));
            COLOR_MAP.put("Gray", new ColorInfo("#808080", 128, 128, 128));
            COLOR_MAP.put("Green", new ColorInfo("#008000", 0, 128, 0));
        };
        
        public static ColorInfo getColor(String name){
            return COLOR_MAP.get(name);
        }
    }

    
    

