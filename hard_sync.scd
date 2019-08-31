//////////Oscillator Sync(Hard Sync)/////////

//sync
{ SyncSaw.ar(60.midicps, 71.midicps, 0.1)  }.scope

//row(Saw.ar) contributes "body" to the sound
{ SyncSaw.ar(60.midicps, 75.midicps + 30, 0.3)   + Saw.ar(60.midicps,0.3)}.scope;

//sweep
{SyncSaw.ar(100, XLine.kr(1000, 300, 2),0.1)}.scope

(
		SynthDef(\sync_elep, {arg midi = 60, amp = 0.1;
			var master, slave, filt, ampfilt, sync, env, fenv, out;

	        master = midi.midicps;
			slave = midi + 11;
	        filt = master * 6;
	        ampfilt = amp.linlin(0, 0.5, filt * 1, filt * 2);

           //hard sync
         	sync = SyncSaw.ar( master, slave.midicps + 20);
	       //amp envelope
			env = EnvGen.kr(Env.perc(0.01,3), levelScale: amp, doneAction: 2) ;
	       //filter envelope
			fenv = EnvGen.kr(Env.perc(0.01,3), levelScale: ampfilt);

	        out = RLPF.ar( RLPF.ar( sync+ Saw.ar( master ) ,fenv, 1), fenv, 0.8) ;
            out = out *  env;
			Out.ar(0, out);
		}).add;

)

Synth(\sync_elep,[ \amp, 0.3 ]);

(
Synth(\sync_elep, [\midi, 55, \amp,0.2]);
Synth(\sync_elep, [\midi, 62, \amp,0.2]);
Synth(\sync_elep, [\midi, 67, \amp,0.1]);
)
)
