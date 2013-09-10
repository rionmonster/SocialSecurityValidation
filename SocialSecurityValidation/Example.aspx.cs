using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Necessary to handle using Regular Expressions
using System.Text.RegularExpressions;

namespace SocialSecurityValidation
{
    public partial class Example : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Basic Validation
        protected void BasicValidationButton_Click(object sender, EventArgs e)
        {
            //Determine validity
            bool isValid = IsSSNBasicallyValid(SSN1.Text);

            //Fire a Javascript alert
            ClientScript.RegisterStartupScript(GetType(), "Basic Validation", String.Format("alert('{0}');", isValid), true);
        }

        protected void ActualValidationButton_Click(object sender, EventArgs e)
        {
            //Determine validity
            bool isValid = IsSSNActuallyValid(SSN2.Text);

            //Fire a Javascript alert
            ClientScript.RegisterStartupScript(GetType(), "Actual Validation", String.Format("alert('{0}');", isValid), true);
        }

        protected void OverTheTopValidationButton_Click(object sender, EventArgs e)
        {
            //Determine validity
            bool isValid = IsSSNOverlyValid(SSN3.Text);

            //Fire a Javascript alert
            ClientScript.RegisterStartupScript(GetType(), "Over-the-Top Validation", String.Format("alert('{0}');", isValid), true);
        }

        //Basic Validation
        public bool IsSSNBasicallyValid(string ssn)
        {
            return new Regex(@"^\d{3}-\d{2}-\d{4}$").IsMatch(ssn);
        }

        //Actual Validation
        public bool IsSSNActuallyValid(string ssn)
        {
            return new Regex(@"^(?!219-09-9999|078-05-1120)(?!666|000|9\d{2})\d{3}-(?!00)\d{2}-(?!0{4})\d{4}$").IsMatch(ssn);
        }

        //Over-the-Top Validation
        public bool IsSSNOverlyValid(string ssn)
        {
            return new Regex(@"^(?!\b(\d)\1+-(\d)\1+-(\d)\1+\b)(?!123-45-6789|219-09-9999|078-05-1120)(?!666|000|9\d{2})\d{3}-(?!00)\d{2}-(?!0{4})\d{4}$").IsMatch(ssn);
        }

    }
}