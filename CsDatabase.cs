using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;


namespace TMS
{
    public class csDatabase
    {
        //private SqlConnection MyCon = new SqlConnection();
        private string MyConString = string.Empty;

        public csDatabase(string MyConnectionString)
        {
            try
            {
                MyConString = MyConnectionString;
            }
            catch (SystemException ex)
            {
                throw new SystemException(ex.Message.ToString());
            }
        }

        public DataSet Return_DataSet(string MyQuery)
        {
            DataSet MyDS = new DataSet();
            try
            {
                using (SqlDataAdapter MyAdp = new SqlDataAdapter(MyQuery, MyConString))
                {
                    MyAdp.Fill(MyDS);
                }
            }
            catch (SystemException ex)
            {
                throw new SystemException(ex.Message.ToString());
            }
            return MyDS;
        }

        public DataTable Return_DataTable(string MyQuery)
        {
            DataTable MyTable = new DataTable();
            try
            {
                using (SqlDataAdapter MyAdp = new SqlDataAdapter(MyQuery, MyConString))
                {
                    MyAdp.Fill(MyTable);
                }
            }
            catch (SystemException ex)
            {
                throw new SystemException(ex.Message.ToString());
            }
            return MyTable;
        }

        public void ExecuteNonQuery(string MyStirng)
        {
            try
            {
                using (SqlConnection MyCon = new SqlConnection(MyConString))
                {
                    MyCon.Open();
                    using (SqlCommand MyCmd = new SqlCommand(MyStirng, MyCon))
                    {
                        MyCmd.ExecuteNonQuery();
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new SystemException(ex.Message.ToString());
            }
        }

        public string Return_SingleField(string MyQuery)
        {
            string MyValue = "";
            try
            {
                using (SqlConnection MyCon = new SqlConnection(MyConString))
                {
                    MyCon.Open();
                    using (SqlCommand MyCmd = new SqlCommand(MyQuery, MyCon))
                    {
                        using (SqlDataReader MyReader = MyCmd.ExecuteReader())
                        {
                            MyReader.Read();
                            if (MyReader.HasRows == false)
                            {
                                MyValue = string.Empty;
                            }
                            else
                            {
                                MyValue = MyReader[0].ToString();
                            }
                        }
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new SystemException(ex.Message.ToString());
            }
            return MyValue;
        }

        public void BatchExecuteNonQuery(string[] MyStrings)
        {
            try
            {
                using (SqlConnection connection =
                           new SqlConnection(MyConString))
                {
                    connection.Open();
                    SqlTransaction transaction;
                    transaction = connection.BeginTransaction("Batch Insert");
                    try
                    {
                        foreach (string MyString in MyStrings)
                        {
                            using (SqlCommand MyCmd = new SqlCommand(MyString, connection, transaction))
                            {
                                MyCmd.CommandType = CommandType.Text;
                                MyCmd.ExecuteNonQuery();
                            }
                        }
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            transaction.Rollback();
                            throw new Exception(ex.Message);
                        }
                        catch (Exception ex1)
                        {
                            throw new Exception(ex1.Message);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
        }

        //public SqlDataReader ReadData(string MyQuery)
        //{
        //    SqlDataReader reader;
        //    try
        //    {
        //        SqlCommand command = new SqlCommand(MyQuery, MyCon);
        //        if (MyCon.State == ConnectionState.Closed)
        //        {
        //            MyCon.Open();
        //        }
        //        reader = command.ExecuteReader();
        //    }
        //    catch (SystemException ex)
        //    {
        //        throw new SystemException(ex.Message.ToString());
        //    }
        //    return reader;
        //}

        public bool IsData(string MyQuery)
        {
            bool MyStatus = false;
            try
            {
                string MyString = "";
                MyString = MyQuery;

                using (SqlConnection MyCon = new SqlConnection(MyConString))
                {
                    MyCon.Open();
                    using (SqlCommand command = new SqlCommand(MyQuery, MyCon))
                    {
                        using (SqlDataReader MyReader = command.ExecuteReader())
                        {
                            if (MyReader.HasRows)
                            {
                                MyStatus = true;
                            }
                            else
                            {
                                MyStatus = false;
                            }
                        }
                    }
                }
            }
            catch (SystemException ex)
            {
                throw new SystemException(ex.Message);
            }
            return MyStatus;
        }

        public DataSet Return_DataSet(SqlCommand MyCmd)
        {
            DataSet _output = new DataSet();
            try
            {
                using (SqlConnection connection =
                           new SqlConnection(MyConString))
                {
                    connection.Open();
                    using (MyCmd)
                    {
                        MyCmd.Connection = connection;
                        using (SqlDataReader MyReader = MyCmd.ExecuteReader())
                        {
                            if (MyReader.HasRows == false)
                            {
                                using (DataTable MyDT = new DataTable())
                                {
                                    _output.Tables.Add(MyDT);
                                }
                            }
                            else
                            {
                                using (DataTable MyDT = new DataTable())
                                {
                                    MyDT.Load(MyReader);
                                    _output.Tables.Add(MyDT);
                                }
                            }
                        }
                    }
                }
            }
            catch (SqlException ex1)
            {
                throw new Exception(ex1.Message.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            return _output;
        }

        public DataTable Return_DataTable(SqlCommand MyCmd)
        {
            DataTable _output = new DataTable();
            try
            {
                using (SqlConnection connection =
                           new SqlConnection(MyConString))
                {
                    connection.Open();
                    using (MyCmd)
                    {
                        MyCmd.Connection = connection;
                        using (SqlDataReader MyReader = MyCmd.ExecuteReader())
                        {
                            if (MyReader.HasRows == false)
                            {
                                using (DataTable MyDT = new DataTable())
                                {
                                    _output = MyDT;
                                }
                            }
                            else
                            {
                                _output.Load(MyReader);
                            }
                        }
                    }
                }
            }
            catch (SqlException ex1)
            {
                throw new Exception(ex1.Message.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            return _output;
        }

        public void ExecuteNonQuery(SqlCommand MyCmd)
        {
            try
            {
                using (SqlConnection connection =
                           new SqlConnection(MyConString))
                {
                    connection.Open();
                    using (MyCmd)
                    {
                        MyCmd.Connection = connection;
                        MyCmd.ExecuteReader();
                    }
                }
            }
            catch (SqlException ex1)
            {
                throw new Exception(ex1.Message.ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
        }

        public string Return_SingleField(SqlCommand MyCmd, string ColumnName)
        {
            string _output = "";
            try
            {
                using (SqlConnection connection =
                           new SqlConnection(MyConString))
                {
                    connection.Open();
                    using (MyCmd)
                    {
                        MyCmd.Connection = connection;
                        using (SqlDataReader MyReader = MyCmd.ExecuteReader())
                        {
                            if (MyReader.HasRows == false)
                            {
                                _output = string.Empty;
                            }
                            else
                            {
                                using (DataTable _Table = new DataTable())
                                {
                                    _Table.Load(MyReader);
                                    _output = _Table.Rows[0][ColumnName].ToString();
                                }
                            }
                        }
                    }
                }
            }
            catch (SqlException ex1)
            {
                throw new Exception(ex1.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
            return _output;
        }

        public bool IsData(SqlCommand MyCmd)
        {
            bool _output = false;
            try
            {
                using (SqlConnection connection =
                          new SqlConnection(MyConString))
                {
                    connection.Open();
                    using (MyCmd)
                    {
                        MyCmd.Connection = connection;
                        using (SqlDataReader MyReader = MyCmd.ExecuteReader())
                        {
                            if (MyReader.HasRows == false)
                            {
                                _output = false;
                            }
                            else
                            {
                                _output = true;
                            }
                        }
                    }
                }
            }
            catch (SqlException ex1)
            {
                throw new Exception(ex1.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return _output;
        }

        public void BatchExecuteNonQuery(SqlCommand[] MyCmds)
        {
            try
            {
                using (SqlConnection connection =
                           new SqlConnection(MyConString))
                {
                    connection.Open();
                    SqlTransaction transaction;
                    transaction = connection.BeginTransaction("Batch Insert");
                    try
                    {
                        foreach (SqlCommand MyCmd in MyCmds)
                        {
                            using (MyCmd)
                            {
                                MyCmd.Connection = connection;
                                MyCmd.Transaction = transaction;
                                MyCmd.ExecuteNonQuery();
                            }
                        }
                        transaction.Commit();
                    }
                    catch (SqlException ex)
                    {
                        try
                        {
                            transaction.Rollback();
                            throw new Exception(ex.Message);
                        }
                        catch (SqlException ex1)
                        {
                            throw new Exception(ex.Message);
                        }
                        catch (Exception ex2)
                        {
                            throw new Exception(ex2.Message);
                        }
                    }
                    catch (Exception ex3)
                    {
                        try
                        {
                            transaction.Rollback();
                            throw new Exception(ex3.Message);
                        }
                        catch (SqlException ex4)
                        {
                            throw new Exception(ex4.Message);
                        }
                        catch (Exception ex5)
                        {
                            throw new Exception(ex5.Message);
                        }
                    }
                }
            }
            catch (SqlException ex1)
            {
                throw new Exception(ex1.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message.ToString());
            }
        }

        ~csDatabase()
        {
            MyConString = string.Empty;
        }
    }

    public class csQueryBuilder
    {
        public enum QueryType
        {
            Select = 0,
            Update = 1,
            Insert = 2,
            Delete = 3,
            Procedure = 4
        }

        public enum ProcType
        {
            Select = 0,
            Update = 1,
            Insert = 2,
            Delete = 3,
        }

        public enum VType
        {
            View = 0,
            Process = 1
        }

        public enum LogicalOperatorList
        {
            None = 0,
            AND = 1,
            OR = 2
        }

        public enum OperatorList
        {
            Equal = 0,
            NotEqual = 1,
            GraterThen = 2,
            GreaterThenEqualTo = 3,
            LessThen = 4,
            LessThenEqualTo = 5
        }

        public enum OrderType
        {
            Ascending = 1,
            Descending = 2
        }

        //private csCollection FieldNames = new csCollection();
        // private csCollection FieldValues = new csCollection();
        //  private csCollection FieldTypes = new csCollection();
        //   private csCollection Criteria = new csCollection();
        private QueryType _QueryType = QueryType.Select;
        //   private csCollection OrderFieldNames = new csCollection();
        private ProcType _ProcType = ProcType.Select;
        private VType _ViewType = VType.View;
        public SqlCommand MyCmd;
        public string ViewQuery = "";
        private string _TableName = "";
        private bool _ParameterRequired = true;
        private bool _CheckScript = false;

        public QueryType QryType
        {
            set { _QueryType = value; }
        }

        public ProcType ProcedureType
        {
            set { _ProcType = value; }
        }

        public VType ViewType
        {
            set { _ViewType = value; }
        }

        public string TableName
        {
            set { _TableName = value; }
        }



        public static class csSQLFormat
        {
            static csSQLFormat()
            {

            }

            private static int _Decimal_Point
            {
                get { return 6; }
            }

            public static string Date_InSqlFormat(string MyDate)
            {
                string MyValue = "";
                try
                {
                    if (MyDate.ToString() == "")
                    {
                        MyValue = "NULL";
                    }
                    else
                    {
                        string MyVarDate = "";
                        MyVarDate = _Date(MyDate);
                        MyValue = "CONVERT(DATETIME, '" + MyVarDate + "', 102)";
                    }
                }
                catch (SystemException ex)
                {
                    throw new SystemException(ex.Message);
                }
                return MyValue;
            }

            private static string _Date(string MyDate)
            {
                string _output = string.Empty;
                try
                {
                    DateTime MyDateTime;
                    MyDateTime = new DateTime();
                    IFormatProvider culture = new System.Globalization.CultureInfo("en-US", true);
                    MyDateTime = Convert.ToDateTime(MyDate, culture);
                    _output = MyDateTime.ToString("u");
                    _output = _output.Remove(_output.Length - 1, 1);
                }
                catch (Exception ex)
                {
                    throw new SystemException(ex.Message);
                }
                return _output;
            }

            public static string String_InSqlFormat(string MyString)
            {
                string MyValue = "";
                try
                {
                    if (MyString.ToString() == "")
                    {
                        MyValue = "NULL";
                    }
                    else
                    {
                        MyValue = "'" + MyString + "'";
                    }
                }
                catch (SystemException ex)
                {
                    throw new SystemException(ex.Message);
                }
                return MyValue;
            }

            public static string int_InSqlFormat(string MyString)
            {
                string MyValue = "";
                try
                {
                    if (MyString.ToString() == "")
                    {
                        MyValue = "NULL";
                    }
                    else
                    {
                        MyValue = "" + MyString + "";
                    }
                }
                catch (SystemException ex)
                {
                    throw new SystemException(ex.Message);
                }
                return MyValue;
            }

            public static string float_InSqlFormat(string MyString)
            {
                string MyValue = "";
                try
                {
                    if (MyString.ToString() == "")
                    {
                        MyValue = "NULL";
                    }
                    else
                    {
                        MyValue = "" + Round(MyString) + "";
                    }
                }
                catch (SystemException ex)
                {
                    throw new SystemException(ex.Message);
                }
                return MyValue;
            }

            public static string decimal_InSqlFormat(string MyString, int Scale)
            {
                string MyValue = "";
                try
                {
                    if (MyString.ToString() == "")
                    {
                        MyValue = "NULL";
                    }
                    else
                    {
                        decimal _value = (string.IsNullOrEmpty(MyString)) ? 0 : Convert.ToDecimal(MyString);
                        _value = System.Math.Round(_value, Scale);
                        MyValue = "" + _value.ToString() + "";
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                return MyValue;
            }

            private static string Round(string MyString)
            {
                string MyValue = "";
                try
                {
                    if (MyString.ToString() == "")
                    {
                        MyValue = "NULL";
                    }
                    else
                    {
                        int _Digit = 0;
                        int _Place = 0;
                        int _Length = 0;

                        _Place = int.Parse(MyString.IndexOf(".").ToString());
                        if (_Place == -1)
                        {
                            MyValue = "" + MyString + "";
                        }
                        else
                        {
                            _Length = int.Parse(MyString.Length.ToString());
                            _Digit = System.Math.Abs(_Length - _Place);
                            if (_Digit <= _Decimal_Point)
                            {
                                MyValue = "" + MyString + "";
                            }
                            else
                            {
                                double _Value = System.Math.Round(double.Parse(MyString), _Decimal_Point);
                                MyValue = "" + _Value.ToString() + "";
                            }
                        }
                    }
                }
                catch (SystemException ex)
                {
                    throw new SystemException(ex.Message);
                }
                return MyValue;
            }
        }

        public static class csDataViewFormat
        {
            static csDataViewFormat()
            {

            }

            public static string Date_InDataViewFormat(string MyDate)
            {
                string MyValue = "";
                try
                {
                    if (MyDate.ToString() == "")
                    {
                        MyValue = "NULL";
                    }
                    else
                    {
                        DateTime MyDtVar = Convert.ToDateTime(MyDate);
                        string MyVarDate = "";
                        MyVarDate = "#";
                        MyVarDate = MyVarDate + MyDtVar.Month.ToString();
                        MyVarDate = MyVarDate + "/";
                        MyVarDate = MyVarDate + MyDtVar.Day.ToString();
                        MyVarDate = MyVarDate + "/";
                        MyVarDate = MyVarDate + MyDtVar.Year.ToString();
                        MyVarDate = MyVarDate + "#";
                        MyValue = MyVarDate;
                    }
                }
                catch (SystemException ex)
                {
                    throw new SystemException(ex.Message);
                }
                return MyValue;
            }
        }

        public static class csExportToExcel
        {
            static csExportToExcel()
            {

            }
        }
    }

}
