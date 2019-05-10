using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// cyy 的摘要说明
/// </summary>
public class cyy
{
    public static string txtToUrl(string str)
    {
        return "<a href='https://" + str + "'>" + str + "</a>";
    }
    public static string txtToUrl(string str1, string str2)
    {
        return "<a href='https://" + str1 + "'>" + str2 + "</a>";
    }

    public static string getVerCode (int num)
    {
        String s = "";
        int i = 0;
        Random ran = new Random();
        while (i != num)
        {
            int j = ran.Next(48, 122);
            if ((j > 47 && j < 58) || (j > 64 && j < 91) || (j > 96 && j < 123))
            {
                s += (char)j;
                i++;
                continue;
            }
            else continue;
        }
        return s;
    }
    public static int judgeDate(int year, int month)
    {
        switch(month)
        {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                return 31;

            case 4:
            case 6:
            case 9:
            case 11:
                return 30;

            case 2:
                if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) return 29;
                else return 28;

            default: return 0;
            
        }
    }

}