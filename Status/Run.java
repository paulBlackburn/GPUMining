public class Run
{
	public static void main(String[] args) 
	{
        Status status;
        String filepath;

        filepath = "gpu_status.txt";
        status = new Status(filepath);
        status.display();
    }
}