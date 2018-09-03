import java.util.ArrayList;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.sql.Timestamp;

public class Status
{
	private class GPU
	{
		private String Model; // Graphics Proccessing Unit Model 
		private Integer MemClock; // Memory Clock (MHz)
		private Integer GPUClock; // Grapics CLock (MHz)
		private Double Power; // Power (W)
		private Integer Temp; // Temperature (C)
		private Integer Speed; // Fan Speed (%)
		
		private GPU(String Model, Double Power, Integer Temp, Integer Speed)
		{
			this.Model = Model;
			this.Power = Power;
			this.Temp = Temp;
			this.Speed = Speed;
		}

		public void setMemClock(Integer MemClock)
		{
			this.MemClock = MemClock;
		}

		public void setGPUClock(Integer GPUClock)
		{
			this.GPUClock = GPUClock;
		}

		public String toString() 
		{
			String text;

			text = "";
			text += String.format("%-15s", "Model:") + Model + "\n";
			text += String.format("%-15s", "Core Clock") + GPUClock + " MHz\n";
			text += String.format("%-15s", "Memory Clock") + MemClock + " MHz\n";
			text += String.format("%-15s", "Power:") + Power + " W\n";
			text += String.format("%-15s", "Temperature:") + Temp + " C\n";
			text += String.format("%-15s", "Fan Speed:") + Speed + " %";

			return text;
		}
	}
	
	private ArrayList<GPU> list;
	private File file;
	private Integer cards;
	private Scanner s;
	private String time_stamp;

	public Status(String filepath)
	{
		list = new ArrayList<>();
		file = new File(filepath);
		time_stamp = null;
		cards = null;
		s = null;
		try
		{
			s = new Scanner(file);
		}
		catch (FileNotFoundException e)
		{
			;
		}
		setupParse(file);
		parseGPUs(file);
		parseClockSpeeds(file);
		getTime();
		s.close();
	}

	private void setupParse(File file)
	{
		String line;

		line = null;

		while(s.hasNextLine() && (cards == null))
		{
			line = s.nextLine();

			if (line.contains("Attached GPUs"))
				parseGPUCount(line);
		}
	}

	private void parseGPUs(File file)
	{
		String line;
		String model;
		Double power;
		Integer temp;
		Integer speed;

		line = null;
		model = null;
		power = null;
		temp = null;
		speed = null;

		for (int i = 0; i < cards; i++)
		{
			while(s.hasNextLine() && (model == null || speed == null || temp == null || power == null))
			{
				line = s.nextLine();

				if (line.contains("Product Name"))
					model = parseName(line);

				else if (line.contains("Fan Speed"))
					speed = parseSpeed(line);

				else if (line.contains("GPU Current Temp"))
					temp = parseTemp(line);

				else if (line.contains("Power Draw"))
					power = parsePower(line);
			}

			list.add(new GPU(model, power, temp, speed));

			model = null;
			power = null;
			temp = null;
			speed = null;
		}
	}

	private void parseClockSpeeds(File file)
	{
		String line;
		Integer mem_clock;
		Integer gpu_clock;

		line = null;
		mem_clock = null;
		gpu_clock = null;

		for (int i = 0; i < cards; i++)
		{
			while(s.hasNextLine() && (mem_clock == null || gpu_clock == null))
			{
				line = s.nextLine();

				if (line.contains("nvclock="))
					gpu_clock = parseGPUClock(line);

				else if (line.contains("memTransferRate="))
					mem_clock = parseMemClock(line);
			}
			list.get(i).setMemClock(mem_clock);
			list.get(i).setGPUClock(gpu_clock);

			mem_clock = null;
			gpu_clock = null;
		}
	}

	private void getTime()
	{
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		time_stamp = timestamp.toString();
	}

	private void parseGPUCount(String line)
	{
		int index;

		index = 0;

		index = line.indexOf(':');
		line = line.substring(index + 2);
		cards = Integer.parseInt(line);
	}

	private String parseName(String line)
	{
		int index;

		index = 0;

		index = line.indexOf(':');
		line = line.substring(index + 2);
		return line;
	}

	private int parseSpeed(String line)
	{
		int index;

		index = 0;

		index = line.indexOf(':');
		line = line.substring(index + 2);
		index = line.indexOf(" %");
		line = line.substring(0, index);

		return Integer.parseInt(line);
	}

	private int parseTemp(String line)
	{
		int index;

		index = 0;

		index = line.indexOf(':');
		line = line.substring(index + 2);
		index = line.indexOf(" C");
		line = line.substring(0, index);

		return Integer.parseInt(line);
	}

	private double parsePower(String line)
	{
		int index;

		index = 0;

		index = line.indexOf(':');
		line = line.substring(index + 2);
		index = line.indexOf(" W");
		line = line.substring(0, index);

		return Double.parseDouble(line);
	}

	private int parseGPUClock(String line)
	{
		int index;

		index = 0;

		index = line.indexOf("nvclock=");
		line = line.substring(index + 8);
		index = line.indexOf(',');
		line = line.substring(0, index);

		return Integer.parseInt(line);
	}

	private int parseMemClock(String line)
	{
		int index;

		index = 0;

		index = line.indexOf("memTransferRate=");
		line = line.substring(index + 16);
		index = line.indexOf(',');
		line = line.substring(0, index);

		return Integer.parseInt(line);
	}

	public void display()
	{
		System.out.println(time_stamp);
		System.out.println("Found GPUs: " + cards);
		for (int i = 0; i < cards; i++)
		{
			System.out.println("*********************************************************");
			System.out.println("GPU[" + i + "]:");
			System.out.println(list.get(i).toString());
			if (i == cards - 1)
				System.out.println("*********************************************************");
		}
	}
}