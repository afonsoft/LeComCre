using System;
using System.Data;
namespace Afonsoft.Libary.Utilities
{
    /// <summary>
    /// Summary description for Class1
    /// </summary>
    public static class DateUtil
    {
        /// <summary>
        /// Validar se é uma data Valida
        /// </summary>
        /// <param name="p">String com a data</param>
        /// <returns>Boolean</returns>
        public static Boolean IsDate(string p)
        {
            try
            {
                p = FormatDate(p, Tipo.SQL);
                Convert.ToDateTime(p);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public enum Tipo { Juliano = 0, Barra = 1, SQL = 2 }

        /// <summary>
        /// Formatar da data para o padrão correto
        /// </summary>
        /// <param name="data">String da data sem formatação</param>
        /// <returns>Data formatada</returns>
        public static String FormatDate(String data, Tipo formato)
        {
            try
            {
                String Dia = "";
                String Mes = "";
                String Ano = "";
                data = data.Trim();

                if (String.IsNullOrEmpty(data))
                    return "";

                //Arrumar o tamanho
                if (data.Length == 10)
                {
                    data = data.Replace("/", "").Replace("-", "").Replace("\\", "");
                }
                if (data.Length == 6)
                {
                    Ano = data.Substring(4, 2);
                    Dia = data.Substring(0, 2);
                    Mes = data.Substring(2, 2);
                    if (Convert.ToInt16(Ano) < 70)
                        Ano = "20" + Ano;
                    else
                        Ano = "19" + Ano;
                }
                else if (data.Length == 8)
                {
                    Ano = data.Substring(4, 4);
                    if (Convert.ToInt16(Ano) > 2070 || Convert.ToInt16(Ano) < 1900)
                    {
                        Ano = data.Substring(0, 4);
                        Mes = data.Substring(4, 2);
                        Dia = data.Substring(6, 2);
                    }
                    else
                    {
                        Dia = data.Substring(0, 2);
                        Mes = data.Substring(2, 2);
                    }
                }
                String rtl = "";
                switch (formato)
                {
                    case Tipo.Juliano:
                        rtl = Ano.ToString() + Mes.ToString() + Dia.ToString();
                        break;
                    case Tipo.Barra:
                        rtl = Dia.ToString() + "/" + Mes.ToString() + "/" + Ano.ToString();
                        break;
                    case Tipo.SQL:
                        rtl = Ano.ToString() + "-" + Mes.ToString() + "-" + Dia.ToString();
                        break;
                }

                return rtl;
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possivel formatar a data.", ex);
            }
        }

        public static Boolean isNumeric(string p)
        {
            try
            {
                Double result;
                Double.TryParse(p, out result);

                return result > 0;

            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DataTable SelectDistinct(DataTable SourceTable, params string[] FieldNames)
        {
            object[] lastValues;
            DataTable newTable;
            DataRow[] orderedRows;

            if (FieldNames == null || FieldNames.Length == 0)
                throw new ArgumentNullException("FieldNames");

            lastValues = new object[FieldNames.Length];
            newTable = new DataTable();

            foreach (string fieldName in FieldNames)
                newTable.Columns.Add(fieldName, SourceTable.Columns[fieldName].DataType);

            orderedRows = SourceTable.Select("", string.Join(", ", FieldNames));

            foreach (DataRow row in orderedRows)
            {
                if (!fieldValuesAreEqual(lastValues, row, FieldNames))
                {
                    newTable.Rows.Add(createRowClone(row, newTable.NewRow(), FieldNames));

                    setLastValues(lastValues, row, FieldNames);
                }
            }

            return newTable;
        }

        private static bool fieldValuesAreEqual(object[] lastValues, DataRow currentRow, string[] fieldNames)
        {
            bool areEqual = true;

            for (int i = 0; i < fieldNames.Length; i++)
            {
                if (lastValues[i] == null || !lastValues[i].Equals(currentRow[fieldNames[i]]))
                {
                    areEqual = false;
                    break;
                }
            }

            return areEqual;
        }

        private static DataRow createRowClone(DataRow sourceRow, DataRow newRow, string[] fieldNames)
        {
            foreach (string field in fieldNames)
                newRow[field] = sourceRow[field];

            return newRow;
        }

        private static void setLastValues(object[] lastValues, DataRow sourceRow, string[] fieldNames)
        {
            for (int i = 0; i < fieldNames.Length; i++)
                lastValues[i] = sourceRow[fieldNames[i]];
        }

    }
}

