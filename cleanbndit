//Clean Bandit - Rather Be
//Listen to the original song https://www.youtube.com/watch?v=m-M1AtrxztU

(
SynthDef(\clean_bndit, { arg freq = 440, amp = 0.7, mix = 0.75, gate = 1, time = 1;
	var snd1, snd2,out, mod, lfo, env;

	mod = freq / 40;

	//balance two oscillator's amplitude
	snd1 = SinOsc.ar( SinOsc.ar(3).range(freq -mod, freq + mod) ) * mix;
	snd2 = SinOsc.ar( (freq / 2) ) *  (1-mix);

	//if you have a MIDI device , you can use ADSR envelope.  Env.adsr( 0.01, 0.1, 0.1, 0.35)
	env = EnvGen.kr( Env.perc(0.01,0.3), gate, levelScale: amp,  timeScale: time,  doneAction: 2 );

	out = HPF.ar( snd1 + snd2, 500);// high pass filter
	out = FreeVerb.ar( out ,0.4, 0.7, 0.7); //add Reverb

	Out.ar(0, out * env);

}).add;
)


Synth(\clean_bndit,[ \freq, 83.midicps, \amp, 0.5 ] );

//HPF cuts the lower frequency( the frequency of snd2 is 110Hz ,snd1 is 220Hz ) //
Synth(\clean_bndit,[ \freq, 57.midicps, \amp, 1.0 ] );


(// A minor
Synth(\clean_bndit,[ \freq,  69.midicps, \amp, 0.5 ,\time, 4 ] );
Synth(\clean_bndit,[ \freq,  72.midicps, \amp, 0.5 ,\time, 3 ] );
Synth(\clean_bndit,[ \freq,  76.midicps, \amp, 0.5 ,\time, 2 ] );
)

