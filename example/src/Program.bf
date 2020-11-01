using System;
using SoLoud;

namespace example
{
	class Program
	{
		private Soloud soLoud = new Soloud() ~ delete _;

		int spin = 0;

		private void visualize_volume()
		{
			int i, p;
			float v = soLoud.getApproximateVolume(0);
			Console.Write("\r{0} ", (char8)("|\\-/"[spin & 3]));
			spin++;
			p = (int)(v * 60);
			if (p > 59) p = 59;
			for (i = 0; i < p; i++)
				Console.Write("=");
			for (i = p; i < 60; i++)
				Console.Write(" ");
		}

		private void speech_test()
		{
			var speech = scope Speech();

			speech.setText("1 2 3       A B C        Doooooo    Reeeeee    Miiiiii    Faaaaaa    Soooooo    Laaaaaa    Tiiiiii    Doooooo!");

			soLoud.setGlobalVolume(4);
			soLoud.play(speech);

			Console.WriteLine("Playing speech test..\n");

			while (soLoud.getVoiceCount() > 0)
			{
				visualize_volume();
			}
			Console.WriteLine("\nFinished.\n");
		}

		void generate_sample(float *buf, ref int32 count, Random rand)
		{
			var base_count = count;
			for (int32 i = 0; i < 2048; i++, base_count++)
			{
				buf[i] = (float)Math.Sin(220 * 3.14 * 2 * base_count * (1 / 44100.0)) -
					     (float)Math.Sin(230 * 3.14 * 2 * base_count * (1 / 44100.0));
				buf[i] += (((rand.NextI32() % 1024) - 512) / 512.0f) *
					      (float)Math.Sin(60 * 3.14 * 2 * base_count * (1 / 44100.0)) *
					      (float)Math.Sin(1 * 3.14 * 2 * base_count * (1 / 44100.0));
				float fade = (44100 * 10 - base_count) / (44100 * 10.0f);
				buf[i] *= fade * fade;
			}
			count = base_count;
		}

		void queue_test()
		{
			var rand = scope Random();
			int32 i;
			int32 count = 0;
			int32 cycle = 0;
			var queue = scope Queue();	
			Wav[] wav = scope Wav[4];
			float[] buf = scope float[2048];
			for (i = 0; i < 4; i++)
				wav[i] = new Wav();
			for (i = 0; i < 2048; i++)
				buf[i] = 0;

			soLoud.play(queue);

			for (i = 0; i < 4; i++)
			{
				generate_sample(&buf[0], ref count, rand);
				wav[i].loadRawWave(&buf[0], 2048, 44100, 1, 1, 0);
				queue.play(wav[i]);
			}

			Console.Write("Playing queue / wav generation test..\n");

			while (count < 44100 * 10 && soLoud.getVoiceCount() > 0)
			{
				if (queue.getQueueCount() < 3)
				{
					generate_sample(&buf[0], ref count, rand);
					wav[cycle].loadRawWave(&buf[0], 2048, 44100, 1, 1, 0);
					queue.play(wav[cycle]);
					cycle = (cycle + 1) % 4;
				}
				visualize_volume();
			}

			while (soLoud.getVoiceCount() > 0)
			{
				visualize_volume();
			}

			Console.Write("\nFinished.\n");

			for (i = 0; i < 4; i++)
				delete wav[i];
		}

		private int Test()
		{
			var result = soLoud.init(Soloud.CLIP_ROUNDOFF | Soloud.ENABLE_VISUALIZATION);
			if(result != 0) {
				Console.WriteLine("SoLoud initialization failed with {0}!", result);
				return 1;
			}

			speech_test();

			queue_test();

			soLoud.deinit();
			return 0;
		}

		public static int Main()
		{
			var program = scope Program();
			return program.Test();
		}
	}
}
