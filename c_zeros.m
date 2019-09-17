function num = c_zeros(bitstream, pos)
        num = 0;
        for b = pos:length(bitstream)
            if bitstream(b) == 0
                num = num + 1;
            else
                return
            end
        end
    end