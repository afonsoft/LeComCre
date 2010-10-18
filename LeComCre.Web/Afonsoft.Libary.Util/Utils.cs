using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;
using System.Reflection;

namespace Afonsoft.Libary.Utilities
{

    public static class Utils
    {
        /// <summary>
        /// Tipo do campo de retorno de um DataRow
        /// </summary>
        public enum TipoCampo { Texto, Numero, Real, Data }
        /// <summary>
        /// Tipo do Valor em caso de nulo
        /// </summary>
        public enum DefaultNull {Padrao, Nulo, Erro }
        /// <summary>
        /// Recuperar o valor de um DataRow, com formatação e validações
        /// </summary>
        /// <param name="dr">DataRow</param>
        /// <param name="Campo">Campo a se recuperar</param>
        /// <param name="tc">Tipo do Campo (Texto, Numero, Real, Data)</param>
        /// <param name="dn">Tipo do Valor em caso de nulo (Padrao, Nulo, Erro)</param>
        /// <returns>String formatada</returns>
        public static string getValor(DataRow dr, String Campo, Nullable<TipoCampo> tc, Nullable<DefaultNull> dn)
        {
            TipoCampo tipoCampo = (tc == null) ? TipoCampo.Texto : (TipoCampo)tc;
            DefaultNull defaultNull = (dn == null) ? DefaultNull.Nulo : (DefaultNull)dn;
            String rtVel = String.Empty;
            Boolean _isNull = false;
            Boolean _isDate = false;

            if (!dr.Table.Columns.Contains(Campo))
                throw new ArgumentNullException(Campo, "Este campo não existe na tabela.");

            try
            {
                if (dr.IsNull(Campo))
                    _isNull = true;

                switch (tipoCampo)
                {
                    case TipoCampo.Texto:
                        rtVel = _isNull ? "" : dr[Campo].ToString();
                        break;
                    case TipoCampo.Real:
                        rtVel = "0.00";
                        if (!_isNull)
                        {
                            Decimal dVel;
                            Decimal.TryParse(dr[Campo].ToString(), out dVel);
                            rtVel = dVel.ToString();
                        }
                        break;
                    case TipoCampo.Numero:
                        rtVel = "0";
                        if (!_isNull)
                        {
                            Double dVel;
                            Double.TryParse(dr[Campo].ToString(), out dVel);
                            rtVel = dVel.ToString();
                        }
                        break;
                    case TipoCampo.Data:
                        if (!_isNull && IsDate(dr[Campo].ToString()))
                            _isDate = true;
                        else
                            throw new InvalidCastException("O campo não é uma data: " + Campo);
                        rtVel = _isNull ? "01/01/1900" : (_isDate) ? FormatDate(dr[Campo].ToString(), TipoData.Barra) : "01/01/1900";
                        break;
                }
            }
            catch (Exception ex) 
            {
                switch (defaultNull)
                {
                    case DefaultNull.Erro:
                        throw new Exception("Erro para recuperar os dados.", ex );
                    case DefaultNull.Padrao:
                        return rtVel;
                    case DefaultNull.Nulo:
                        return null;
                }
            }

            return rtVel;
        }

        public static string getValor(DataRow dr, String Campo)
        { return getValor(dr, Campo, null, null); }
        public static string getValor(IDataReader dr, String Campo)
        { return getValor(dr, Campo, null, null); }
        public static string getValor(DataRow dr, String Campo, Nullable<TipoCampo> tc)
        { return getValor(dr, Campo, tc, null); }
        public static string getValor(IDataReader dr, String Campo, Nullable<TipoCampo> tc)
        { return getValor(dr, Campo, tc, null); }
        public static string getValor(DataRow dr, String Campo, Nullable<DefaultNull> dn)
        { return getValor(dr, Campo, null, dn); }
        public static string getValor(IDataReader dr, String Campo, Nullable<DefaultNull> dn)
        { return getValor(dr, Campo, null, dn); }
        /// <summary>
        /// Recuperar o valor de um DataRow, com formatação e validações
        /// </summary>
        /// <param name="dr">DataRow</param>
        /// <param name="Campo">Campo a se recuperar</param>
        /// <param name="tc">Tipo do Campo (Texto, Numero, Real, Data)</param>
        /// <param name="dn">Tipo do Valor em caso de nulo (Padrao, Nulo, Erro)</param>
        /// <returns>String formatada</returns>
        public static string getValor(IDataReader dr, String Campo, Nullable<TipoCampo> tc, Nullable<DefaultNull> dn)
        {
            TipoCampo tipoCampo = (tc == null) ? TipoCampo.Texto : (TipoCampo)tc;
            DefaultNull defaultNull = (dn == null) ? DefaultNull.Nulo : (DefaultNull)dn;
            String rtVel = String.Empty;
            Boolean _isNull = false;
            Boolean _isDate = false;

            if (!HasColumn(dr,Campo))
                throw new ArgumentNullException(Campo, "Este campo não existe na tabela.");

            try
            {
                if (Convert.IsDBNull(dr[Campo]))
                    _isNull = true;

                switch (tipoCampo)
                {
                    case TipoCampo.Texto:
                        rtVel = _isNull ? "" : dr[Campo].ToString();
                        break;
                    case TipoCampo.Real:
                        rtVel = "0.00";
                        if (!_isNull)
                        {
                            Decimal dVel;
                            Decimal.TryParse(dr[Campo].ToString(), out dVel);
                            rtVel = dVel.ToString();
                        }
                        break;
                    case TipoCampo.Numero:
                        rtVel = "0";
                        if (!_isNull)
                        {
                            Double dVel;
                            Double.TryParse(dr[Campo].ToString(), out dVel);
                            rtVel = dVel.ToString();
                        }
                        break;
                    case TipoCampo.Data:
                        if (!_isNull && IsDate(dr[Campo].ToString()))
                            _isDate = true;
                        else
                            throw new InvalidCastException("O campo não é uma data: " + Campo);
                        rtVel = _isNull ? "01/01/1900" : (_isDate) ? FormatDate(dr[Campo].ToString(), TipoData.Barra) : "01/01/1900";
                        break;
                }
            }
            catch (Exception ex)
            {
                switch (defaultNull)
                {
                    case DefaultNull.Erro:
                        throw new Exception("Erro para recuperar os dados.", ex);
                    case DefaultNull.Padrao:
                        return rtVel;
                    case DefaultNull.Nulo:
                        return null;
                }
            }

            return rtVel;
        }
        public static string ObterValorReal(string Valor)
        {
            System.Globalization.NumberFormatInfo nfi = new System.Globalization.CultureInfo("pt-BR", false).NumberFormat;
            nfi.NumberGroupSeparator = ".";
            nfi.NumberDecimalDigits = 2;
            nfi.NumberDecimalSeparator = ",";

            return Convert.ToDecimal(Valor).ToString("N", nfi);
        }

        /// <summary>
        /// Valida se o email é valido.
        /// </summary>
        /// <param name="p">Email para se validar</param>
        /// <returns>True ou False</returns>
        public static bool isEmailValid(String p)
        {
            if (String.IsNullOrEmpty(p))
                return false;
            if (p.IndexOf("@") != -1 && p.IndexOf(".") != -1)
                return true;
            else
                return false;
        }

        /// <summary>
        /// Valida se a string é uma data valida
        /// </summary>
        /// <param name="p">String com a data</param>
        /// <returns>true ou false</returns>
        public static Boolean IsDate(string p)
        {
            try
            {
                p = FormatDate(p);
                Convert.ToDateTime(p);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        /// <summary>
        /// Converter uma String para um Data Valida
        /// </summary>
        /// <param name="p">String com a data</param>
        /// <returns>DateTime correto.</returns>
        public static Nullable<DateTime> StringToDate(String p)
        {
            try
            {
                if (String.IsNullOrEmpty(p))
                    return null;
                if (!IsDate(p))
                    return null;
                p = FormatDate(p);
                return DateTime.Parse(p);
            }
            catch (Exception)
            {
                return null;
            }

        }

        public enum TipoData {SQL, Juliano, Barra }
         /// <summary>
        /// Formatar da data para o padrão correto
        /// </summary>
        /// <param name="data">String da data sem formatação</param>
        /// /// <param name="TipoData">Tipo de retorno, SQL, Juliano, _/_/_</param>
        /// <returns>Data formatada</returns>
        public static String FormatDate(String data, TipoData td)
        {
            Nullable<DateTime> dt = StringToDate(data);
            String rtVal = String.Empty;

            if (!dt.HasValue && !IsDate(data))
                return null;

            String dtime = dt.Value.ToShortDateString();
            String dFormat = FormatDate(dtime);

            switch (td)
            {
                case TipoData.Barra:
                    rtVal = dFormat.Substring(8,2) +  "/" + dFormat.Substring(5,2) +  "/" + dFormat.Substring(0, 4);
                    break;
                case TipoData.Juliano:
                    rtVal = dFormat.Substring(0, 4) + dFormat.Substring(5, 2) + dFormat.Substring(8, 2);
                    break;
                case TipoData.SQL:
                    rtVal = dFormat;
                    break;
            }

            return rtVal;
        }
        /// <summary>
        /// Formatar da data para o padrão correto
        /// </summary>
        /// <param name="data">String da data sem formatação</param>
        /// <returns>Data formatada</returns>
        public static String FormatDate(String data)
        {
            try
            {
                String Dia = "";
                String Mes = "";
                String Ano = "";

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

                return Ano.ToString() + "-" + Mes.ToString() + "-" + Dia.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Não foi possivel formatar a data.", ex);
            }
        }

        public static bool HasColumn(IDataRecord dr, string columnName)
        {
            for (int i = 0; i < dr.FieldCount; i++)
            {
                if (dr.GetName(i).Equals(columnName, StringComparison.InvariantCultureIgnoreCase))
                    return true;
            }
            return false;
        }

        #region Load
        /// <summary>
        /// Esta função irá preencher o p_object passado com o DataRow passado em 
        /// Assume-se que as colunas DataRow corresponder exactamente ao propriedades na 
        /// Objeto passado dentro
        /// </summary>
        /// <param name="p_dcc">Colunas</param>
        /// <param name="p_dr">DataRow</param>
        /// <param name="p_object">Objeto a ser populado</param>
        public static void LoadObject(DataColumnCollection p_dcc, DataRow p_dr, Object p_object)
        {
            Type t = p_object.GetType(); //This is used to do the reflection
            for (Int32 i = 0; i <= p_dcc.Count - 1; i++)
            {
                //Don't ask it just works
                try
                {  //NOTE the datarow column names must match exactly (including case) to the object property names
                    t.InvokeMember(p_dcc[i].ColumnName, BindingFlags.SetProperty, null, p_object, new object[] { p_dr[p_dcc[i].ColumnName] });
                }
                catch (Exception ex)
                { //Usually you are getting here because a column doesn't exist or it is null
                    if (ex.ToString() != null)
                    { }
                }
            };//for i
        }

        /// <summary>
        /// Esta função irá preencher o p_object passado 
        /// </summary>
        /// <param name="p_dr">IDataReader</param>
        /// <param name="p_object">Objeto a ser populado</param>
        public static void LoadObject(IDataReader p_dr, Object p_object)
        {
            Type t = p_object.GetType(); //This is used to do the reflection
            for (Int32 i = 0; i <= p_dr.FieldCount - 1; i++)
            {
                //Don't ask it just works
                try
                {  //NOTE the datarow column names must match exactly (including case) to the object property names
                    t.InvokeMember(p_dr.GetName(i), BindingFlags.SetProperty, null, p_object, new object[] { p_dr[p_dr.GetName(i)] });
                }
                catch (Exception ex)
                { //Usually you are getting here because a column doesn't exist or it is null
                    if (ex.ToString() != null)
                    { }
                }
            };//for i
        }
        #endregion

        #region ObjectToTableConvert
        /// <summary>
        /// Este método leva em um objeto e reflexão toma as propriedades
        /// Cria uma tabela se ela já não existe
        /// Adiciona uma linha para a tabela em um dataset.
        /// </summary>
        /// <param name="p_obj"></param>
        /// <param name="p_ds"></param>
        /// <param name="p_tableName"></param>
        public static void ObjectToTableConvert(Object p_obj, ref DataSet p_ds, String p_tableName)
        {
            //we need the type to figure out the properties
            Type t = p_obj.GetType();
            //Get the properties of our type
            PropertyInfo[] tmpP = t.GetProperties();

            //We need to create the table if it doesn't already exist
            if (p_ds.Tables[p_tableName] == null)
            {
                p_ds.Tables.Add(p_tableName);
                //Create the columns of the table based off the properties we reflected from the type
                foreach (PropertyInfo xtemp2 in tmpP)
                {
                    p_ds.Tables[p_tableName].Columns.Add(xtemp2.Name, xtemp2.PropertyType);
                } //foreach
            }
            //Now the table should exist so add records to it.

            Object[] tmpObj = new Object[tmpP.Length];

            for (Int32 i = 0; i <= tmpObj.Length - 1; i++)
            {
                tmpObj[i] = t.InvokeMember(tmpP[i].Name, BindingFlags.GetProperty, null, p_obj, new object[0]);
            }
            //Add the row to the table in the dataset
            p_ds.Tables[p_tableName].LoadDataRow(tmpObj, true);
        }
        #endregion

        /// <summary>
        /// Função para recuperar um objeto dentro de uma coleção de objetos, 
        /// como o Framework 1.1 e 2.0 não existem metodos proprios para varrer uma colção de itens
        /// foi desenvolvido este metodo para procurar todas as propriedades de objeto e comparar-lo
        /// com o nome da coluna, se for igual, ele irá comparar a propriedade desta coluna 
        /// com o Valor do campo, se for igual retorna o objeto encontrado, se não returna null.
        /// </summary>
        /// <param name="p_obj">Objeto a ser varrido</param>
        /// <param name="ValorCampo">Valor do campo a ser comparado</param>
        /// <param name="NomeColuna">Nome do Campo do objeto sendo varrido.</param>
        /// <returns>object ou null</returns>
        public static object FindObject(object[] p_obj, string ValorCampo, string NomeColuna)
        {
            object rt = null;
            bool _ok = false;
            foreach (object obj in p_obj)
            {
                Type t = obj.GetType();
                PropertyInfo[] tmpP = t.GetProperties();
                foreach (PropertyInfo xtemp2 in tmpP)
                {
                    if (xtemp2.Name == NomeColuna)
                        if (xtemp2.GetValue(obj, null).ToString().ToUpper().Trim() == ValorCampo.ToUpper().Trim())
                        {
                            rt = obj;
                            _ok = true;
                            break;
                        }
                }
                if (_ok)
                    break;
            }
            return rt;
        }
        public static void SortList<T>(List<T> dataSource, string fieldName, SortDirection sortDirection)
        {
            PropertyInfo propInfo = typeof(T).GetProperty(fieldName);
            Comparison<T> compare = delegate(T a, T b)
            {
                bool asc = sortDirection == SortDirection.Ascending;
                object valueA = asc ? propInfo.GetValue(a, null) : propInfo.GetValue(b, null);
                object valueB = asc ? propInfo.GetValue(b, null) : propInfo.GetValue(a, null);

                return valueA is IComparable ? ((IComparable)valueA).CompareTo(valueB) : 0;
            };
            dataSource.Sort(compare);
        }

        public static List<T> CreateSortList<T>(IEnumerable<T> dataSource,
                string fieldName, SortDirection sortDirection)
        {
            List<T> returnList = new List<T>();
            returnList.AddRange(dataSource);
            PropertyInfo propInfo = typeof(T).GetProperty(fieldName);
            Comparison<T> compare = delegate(T a, T b)
            {
                bool asc = sortDirection == SortDirection.Ascending;
                object valueA = asc ? propInfo.GetValue(a, null) : propInfo.GetValue(b, null);
                object valueB = asc ? propInfo.GetValue(b, null) : propInfo.GetValue(a, null);

                return valueA is IComparable ? ((IComparable)valueA).CompareTo(valueB) : 0;
            };
            returnList.Sort(compare);
            return returnList;
        }

        public static bool isNumeric(string op)
        {
            double i = double.MinValue;
            return double.TryParse(op, out i);
        }
    }
}
