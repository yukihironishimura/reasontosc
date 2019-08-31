//////////Amplitude Modulation/////////////

(
SynthDef(\am_piano, {arg midi = 60, mix = 0.5,amp = 0.1;
	var note, filt, row, am, balance, env, out, ampfilt;

	note = midi.midicps;
	filt = note * 6;
	//loe amplitude, low filter frequency. high amplitude, high fileter frequency
	ampfilt = amp.linlin(0, 0.5, filt * 1, filt * 2);

    //amplitude modulation
	row = DelayN.ar( Saw.ar( note ), 0.1, 0.001) ;
	am = row * DelayN.ar( Saw.ar( note * 4, 1, 0.5 ), 0.1, 0.002);
	// if row is 0.5, am=0.5. row=0.1 , am=0.9
	balance = am * mix + (row*(1-mix) );

	env = EnvGen.kr(Env.perc(0.01,3), levelScale: amp, doneAction: 2);
	out = RLPF.ar( RLPF.ar( balance , ampfilt, 1), ampfilt, 0.8) ;
	out = Out.ar( [ 0, 1 ], out  * env);
}).add;
)

Synth(\am_piano, [\midi, 60, \mix, 0.9,\amp,0.5]);

(
Synth(\am_piano, [\midi, 55, \mix, 0.1,\amp,0.2]);
Synth(\am_piano, [\midi, 62, \mix, 0.7,\amp,0.1]);
Synth(\am_piano, [\midi, 67, \mix, 0.9,\amp,0.1]);
)

