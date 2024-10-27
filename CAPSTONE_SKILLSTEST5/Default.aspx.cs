using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace CAPSTONE_SKILLSTEST5
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_OnClick(object sender, EventArgs e)
        {
            string name = TxtName.Text;
            string email = TxtEmail.Text;

            string connectionString = WebConfigurationManager.ConnectionStrings["SkillsTestDB5"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string sql = "INSERT INTO Users (Name, Email) VALUES (@Name, @Email)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.ExecuteNonQuery();
                }
            }

            GridView1.DataBind();
        }
    }
}