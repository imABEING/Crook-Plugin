<Cabbage>
form caption("CROOK") size(500, 400), colour(58, 110, 182), pluginid("def1")
image file("Dist.jpg"), bounds(0, 0, 500, 400), outlinecolour(0, 0, 0, 255)

image file("Crook_transparent.png"), bounds(40, 12, 420, 116), , outlinecolour(0, 0, 0, 255)

image file("knob_05_shadow_001.png"), bounds(150, 180, 200, 200), tofront(), outlinecolour("0, 0, 0")

image bounds(150, 180, 200, 200), file("knob_05_001.png") 
image bounds(150, 180, 200, 200), file("knob_05_001.png"), identchannel("sliderIdent")

rslider bounds(150, 180, 200, 200), channel("dist"), range(0, 1, 0, 1, .01), alpha(0),text("CRUNCH"), trackercolour("lime"), outlinecolour(0, 0, 0, 50), textcolour("black")

label align("centre"),  alpha(.35), bounds(350, 370, 150, 20), channel("chan"), colour("0,0,0,0"), fontcolour("0,192,192"), text("@rolexalexx")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-o dac
-d
-i adc
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


;gifn	ftgen	0,0, 257, 9, .5,1,270
gifn	ftgen	0,0, 257, 9, .5,1,270,1.5,.33,90,2.5,.2,270,3.5,.143,90,4.5,.111,270


instr 1
kSlider chnget "dist"
if changed(kSlider)==1 then
	chnset kSlider>0.05 ? k(1) : k(0), "led1"
	chnset kSlider>0.1 ? k(1) : k(0), "led2"
	chnset kSlider>0.2 ? k(1) : k(0), "led3"
	chnset kSlider>0.3 ? k(1) : k(0), "led4"
	chnset kSlider>0.4 ? k(1) : k(0), "led5"
	chnset kSlider>0.5 ? k(1) : k(0), "led6"
	chnset kSlider>0.6 ? k(1) : k(0), "led7"
	chnset kSlider>0.7 ? k(1) : k(0), "led8"
	chnset kSlider>0.8 ? k(1) : k(0), "led9"
	chnset kSlider>0.9 ? k(1) : k(0), "led10"
endif
endin


instr 2
kGain chnget "gain"

a1 inch 1
a2 inch 2


;Dist Slider
kdist = chnget:k("dist")

if metro(25) == 1 then
        if changed(kdist) == 1 then
            SMessage sprintfk "rotate(%f, 100, 80, 80)", (kdist*3.14159265359)*1.5
            chnset SMessage, "sliderIdent"
        endif
    endif


kdist		port		kdist, .01

k1	line	0, .5, 2	 
 
adist1 	distort	a1, kdist, gifn
adist2 	distort	a2, kdist, gifn

	
	outs adist1, adist2
	

endin


</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 z
i2 0 z 
</CsScore>
</CsoundSynthesizer>
