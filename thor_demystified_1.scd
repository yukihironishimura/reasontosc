//Thor demystified 1 ( no filter, no modulator )
//https://www.propellerheads.com/blog/thor-demystified-1-the-analogue-oscillator



/////Sawtooth ( detune )/////
(
SynthDef(\sawdetune,	{ arg midi = 60, detune = 0.3, delay1 = 0.003, delay2 = 0.001, amp = 0.5;
		var snd1, snd2, snd3, out;

		snd1 = Saw.ar( midi.midicps + detune); //detune
		snd2 = DelayN.ar( Saw.ar( midi.midicps - detune), 0.1, delay1); //detune
		snd3 = DelayN.ar( Saw.ar( midi.midicps), 0.1, delay2); //no detune

		out = snd1 + snd2 +snd3 * 0.3 ;
		Out.ar(0, out * amp );

}).add;
)

Synth(\sawdetune);

(// C major
Synth(\sawdetune, [\midi, 60] );
Synth(\sawdetune, [\midi, 64] );
Synth(\sawdetune, [\midi, 67] );
)




//////Sine ( octave, fifth ) like a Hammond Organ//////
(
SynthDef(\sine, { arg midi = 60, detune1 = 0, detune2 = 0, phase1 = 0.3pi, phase2 = 0.2pi, out, amp = 0.2;
	var snd1, snd2, snd3;

	snd1 = SinOsc.ar(midi.midicps);
	snd2 = SinOsc.ar( (midi + 12).midicps + detune1, phase1); // octave, detune
	snd3 = SinOsc.ar( (midi + 12 + 7).midicps + detune2, phase2); //octave + fifth, detune

	out = snd1 + snd2 +snd3 * 0.3;
	Out.ar(0, out * amp);
}).add;
)

Synth(\sine);

(// C major
Synth(\sine, [\midi, 60] );
Synth(\sine, [\midi, 64] );
Synth(\sine, [\midi, 67] );
)

//low speed rotating speaker ( always with the detuned value for snd3 set to double that of snd2)
(
Synth(\sine, [\midi,60, \detune1, 2, \detune2, 4 ]);
Synth(\sine, [\midi,64, \detune1, 2, \detune2, 4 ]);
Synth(\sine, [\midi,67, \detune1, 2, \detune2, 4 ]);
)

//increasing the effect
(
Synth(\sine, [ \midi, 60, \detune1, 5, \detune2, 10 ]);
Synth(\sine, [ \midi, 64, \detune1, 5, \detune2, 10 ]);
Synth(\sine, [ \midi, 67, \detune1, 5, \detune2, 10 ]);
)



/////Bass-Fifth/////
(
SynthDef(\bassfifth, { arg midi = 40, detune = 0.5, delay = 0.001, amp = 0.5;
	var snd1, snd2, out;

	snd1 = Saw.ar(midi.midicps);
	snd2 = DelayN.ar(Saw.ar( ( midi + 7).midicps + detune),0.1, delay);  //fifth, detune

	out = snd1 + snd2;

	Out.ar(0, out * amp)
}).add;
)

Synth(\bassfifth);

(
Synth(\bassfifth,[ \midi, 40, \amp, 0.3] );
Synth(\bassfifth,[ \midi, 52, \amp, 0.2] );
Synth(\bassfifth,[ \midi, 59, \amp, 0.1] );
)


