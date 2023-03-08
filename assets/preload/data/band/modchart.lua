local noteJumpLength = 0

function start(song)
	
end

function update(elapsed)
	
end

function beatHit(beat)
	if (beat > 152 and beat < 280) or (beat > 80 and beat < 144) then
	    for i = 0,7,1 do
	    	local note = _G['receptor_'..i]
		if beat % 2 == 0 then
		    note.x = note.x + noteJumpLength
		    note:tweenPos(note.x - noteJumpLength, note.y, 0.15)
		else
		    note.x = note.x - noteJumpLength
		    note:tweenPos(note.x + noteJumpLength, note.y, 0.15)
		end
	    end
	end
	if beat > 184 then
		noteJumpLength = 40
	end
	if beat == 280 then
		camGame:tweenZoom(1,(crochet * 4) / 1000)
	end
end

function stepHit(step)
	if step > 320 and step < 576 and noteJumpLength ~= 30 then
		noteJumpLength = noteJumpLength + 0.12
	end
end