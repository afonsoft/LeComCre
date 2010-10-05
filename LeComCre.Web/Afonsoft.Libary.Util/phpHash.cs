using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace Afonsoft.Libary.php
{
    public class phpHash
    {
        private static phpHash instance = null;

        public static phpHash getSingleton()
        {
            if (instance == null) instance = new phpHash(); return instance;
        }         // Hash an input string and return the hash as       
        // a 32 character hexadecimal string.       
        string md5(string input)
        {
            // Create a new instance of the MD5CryptoServiceProvider object.        
            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
            // Convert the input string to a byte array and compute the hash.           
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            // Create a new Stringbuilder to collect the bytes        
            // and create a string.        
            StringBuilder sBuilder = new StringBuilder();
            // Loop through each byte of the hashed data        
            // and format each one as a hexadecimal string.        
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
        // Hash an input string and return the hash as    
        // a 32 character hexadecimal string.       
        byte[] md5bin(string input)
        {
            // Create a new instance of the MD5CryptoServiceProvider object.      
            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
            // Convert the input string to a byte array and compute the hash.           
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            return data;
        }
        private int ord(byte ch)
        {
            return ((int)ch);
        }

        private double ConvertToUnixTimestamp(DateTime date)
        {
            DateTime origin = new DateTime(1970, 1, 1, 0, 0, 0, 0);
            TimeSpan diff = date - origin;
            return Math.Floor(diff.TotalSeconds);
        }
        /**        * Return unique id        * @param string $extra additional entropy        */
        private string unique_id()
        {            //char extra = 'c';       
            double val = ConvertToUnixTimestamp(DateTime.UtcNow);
            String vals = md5(val.ToString());
            return vals.Substring(4, 16);
        }
        public String phpbb_hash(String password)
        {
            String itoa64 = "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            String random_state = unique_id();
            List<byte> random = new List<byte>();
            int count = 6;
            if (random.Count < count)
            {
                random = new List<byte>();
                for (int i = 0; i < count; i += 16)
                {
                    random_state = md5(unique_id() + random_state);
                    random.AddRange(md5bin(random_state));
                }
                random = random.GetRange(0, count);
            }
            String hashGensaltPrivate = _hash_gensalt_private(random.ToArray(), itoa64, 6);
            String hash = _hash_crypt_private(password, hashGensaltPrivate, itoa64);
            if (hash.Length == 34)
            {
                return hash;
            }
            return md5(password);
        }
        public bool phpbb_check_hash(String password, String hash)
        {
            String itoa64 = "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            if (hash.Length == 34)
            {
                return (_hash_crypt_private(password, hash, itoa64) == hash) ? true : false;
            }
            return (md5(password) == hash) ? true : false;
        }

        private string _hash_gensalt_private(byte[] input, String itoa64, int iteration_count_log2)
        {
            if (iteration_count_log2 < 4 || iteration_count_log2 > 31)
            {
                iteration_count_log2 = 8;
            }
            String output = "$H$";
            output += itoa64[Math.Min(iteration_count_log2 + 5, 30)];
            output += _hash_encode64(input, 6, itoa64);
            return output;
        }

        private string _hash_encode64(byte[] input, int count, String itoa64)
        {
            String output = "";
            int i = 0;
            do
            {
                int value = ord(input[i++]);
                output += itoa64[value & 0x3f];
                if (i < count)
                {
                    value |= ord(input[i]) << 8;
                }
                output += itoa64[(value >> 6) & 0x3f];
                if (i++ >= count)
                {
                    break;
                }
                if (i < count)
                {
                    value |= ord(input[i]) << 16;
                }
                output += itoa64[(value >> 12) & 0x3f];
                if (i++ >= count)
                {
                    break;
                }
                output += itoa64[(value >> 18) & 0x3f];
            }
            while (i < count);

            return output;
        }

        private string _hash_crypt_private(String password, String setting, String itoa64)
        {
            String output = "*";

            if (setting.Substring(0, 3) != "$H$")
            {
                return output;
            }
            int count_log2 = itoa64.IndexOf(setting[3]);

            if (count_log2 < 7 || count_log2 > 30)
            {
                return output;
            }
            int count = 1 << count_log2;
            string salt = setting.Substring(4, 8);
            if (salt.Length != 8)
            {
                return output;
            }
            byte[] hashBin = md5bin(salt + password);
            do
            {
                hashBin = md5bin(ASCIIEncoding.Default.GetString(hashBin) + password);
            }
            while (--count != 0);

            output = setting.Substring(0, 12);
            output += _hash_encode64(hashBin, 16, itoa64);

            return output;
        }
    }

}