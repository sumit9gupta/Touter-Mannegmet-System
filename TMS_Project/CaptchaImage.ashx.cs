using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;

namespace TMS_Project
{
    public class CaptchaImage : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            string code = GenerateCode();
            context.Session["Captcha"] = code; 

            using (Bitmap bmp = new Bitmap(120, 40))
            using (Graphics g = Graphics.FromImage(bmp))
            using (Font font = new Font("Arial", 20, FontStyle.Bold))
            {
                g.Clear(Color.White);

                
                g.DrawString(code, font, Brushes.Black, 10, 5);

               
                Random rnd = new Random();
                Pen pen = new Pen(Color.Gray);
                for (int i = 0; i < 3; i++)
                {
                    g.DrawLine(pen, rnd.Next(0, 120), rnd.Next(0, 40), rnd.Next(0, 120), rnd.Next(0, 40));
                }

                
                context.Response.ContentType = "image/png";
                bmp.Save(context.Response.OutputStream, ImageFormat.Png);
            }
        }

        private string GenerateCode()
        {
            string chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
            Random rnd = new Random();
            char[] captcha = new char[5];
            for (int i = 0; i < captcha.Length; i++)
            {
                captcha[i] = chars[rnd.Next(chars.Length)];
            }
            return new string(captcha);
        }

        public bool IsReusable { get { return false; } }
    }
}
