use_bpm 113
define :melody_player do |note|
  16.times do
    use_synth :chiplead
    play (ring note, note, :D5, :r, :A4, :r, :r, :Ab4, :r, :G4, :r, :F4, :r, :D4, :F4, :G4).tick
    sleep 0.25
  end
end

define :base_player do |base_note|
  use_synth :chipbass
  2.times do
    play base_note
    sleep 0.25
  end
  7.times do
    play base_note
    sleep 0.5
  end
end

define :beat_player do
  4.times do
    sample :drum_bass_hard
    sleep 0.5
    sample :drum_snare_hard
    sleep 0.5
  end
end

base_player :D4
base_player :C4
base_player :B3
base_player :Bb3

in_thread do
  12.times do
    beat_player
  end
end

in_thread do
  2.times do
    base_player :D4
    base_player :C4
    base_player :B3
    base_player :Bb3
  end
end


in_thread do
  sleep 16
  2.times do
    melody_player :D4
    melody_player :C4
    melody_player :B3
    melody_player :Bb3
  end
end


