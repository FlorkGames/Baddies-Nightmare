function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullets' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteTypes/Bullets'); 
			

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			end
		end
	end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullets' then
		--cameraFlash('camGame', '9BC4C6', 0.2, false)
		playSound('gun', 0.5);
		characterPlayAnim('dad', 'shot', true);
		characterPlayAnim('boyfriend', shootAnims[direction + 1], false);
		setProperty('boyfriend.specialAnim', true);
		cameraShake('camGame', 0.02, 0.2)
		setProperty('health', getProperty('health')+0.05);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == "Bullets" then
		if difficulty == 2 then
			setProperty('health', getProperty('health')-500);
		end
		if difficulty == 1 then
			setProperty('health', getProperty('health')-0.3);
			characterPlayAnim('boyfriend', 'yikes', true);
		end
		characterPlayAnim('boyfriend', 'yikes', true);
	end
end
