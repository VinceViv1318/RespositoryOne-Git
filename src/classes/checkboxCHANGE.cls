public class checkboxCHANGE {
    public class AssignComment        // This class will be used to store the corresponding input from the user and the CaseComment.
    {  
        public CaseComment comment {get; set;}        //This will store the CaseComment.
        public Boolean published {get; set;}          //This will store the input from the user.
        public AssignComment(){}                      //Empty constructor.
    }    
    public List<assignComment> Records {get; set;}    //This will store the list of CaseComments as well as the corresponding user inputs.
    public checkboxCHANGE(ApexPages.StandardController controller)
    {
        Records = new List<AssignComment>();          
        Case Record = (Case) controller.getRecord();    //Get case from controller.
        for (CaseComment Node : [Select commentBody, isPublished from CaseComment where parentId = :Record.Id])    //Query and loop through all the CaseComments.
        {
            assignComment temp = new AssignComment();   // Create temp to insert into the list Records.
            temp.comment = Node;
            temp.published = Node.isPublished;
            Records.add(Temp);
        }
    }
    public PageReference CustomSave()    //This class will take the input from the user and update the corresponding CaseComments.
    {
        List<CaseComment> updateList = new List<CaseComment>();    //Create a list of CaseComments to be updated.
        for (AssignComment a : Records)        //Loop through Records.
        {
            a.comment.isPublished = a.published;    //Update CaseComments with user input.
            updateList.add(a.comment);
        }
        update(updateList);
        return null;
    }  
}