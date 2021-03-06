% ----------------------------------------------------------------------
%    generate facet indices
%    20180809  y.yoshimura
%    Inputs:
%   Outputs:
%   related function files:
%   note:
%   cf:
%   revisions;
%   face = f4cube(split, Ca)
%   (c) 2018 yasuhiro yoshimura
%----------------------------------------------------------------------
%// 面index生成 直方体ver.
function face = f4cube(split, Ca)

face = cell(1,6);
for k=1:6
    switch (k)
        case 1%: // X+面;
            for i=1:split(3)
                for j=1:split(2)
                    
                    num = j + (i - 1) * split(2);
                    
                    face{k}.make(num,1) = j + (i - 1) * (split(2) + 1);
                    face{k}.make(num,2) = face{k}.make(num,1) + 1;
                    face{k}.make(num,3) = j + 1 + i * (split(2)+1);
                    face{k}.make(num,4) = face{k}.make(num,3) - 1;
                    
                    face{k}.Ca(num) = Ca(1);
                    face{k}.Cd(num) = Ca(2);
                    face{k}.Cs(num) = Ca(3);
                    face{k}.Ct(num) = Ca(4);
                end
            end
            
        case 2%: // X-面
            for i=1:split(3)
                for j=1:split(2)
                    
                    num = j + (i - 1) * split(2);
                    
                    face{k}.make(num,1) = j + (i - 1) * (split(2) + 1);
                    face{k}.make(num,2) = j + i * (split(2)+1);
                    face{k}.make(num,3) = face{k}.make(num,2) + 1;
                    face{k}.make(num,4) = face{k}.make(num,1) + 1;
                    
                    
                    face{k}.Ca(num) = Ca(1);
                    face{k}.Cd(num) = Ca(2);
                    face{k}.Cs(num) = Ca(3);
                    face{k}.Ct(num) = Ca(4);
                end
            end
            
        case 3%: // Y+面
            for i=1:split(1)
                for j=1:split(3)
                    
                    num = j + (i - 1) * split(3);
                    
                    face{k}.make(num,1) = j + (i - 1) * (split(3) + 1);
                    face{k}.make(num,2) = face{k}.make(num,1) + 1;
                    face{k}.make(num,3) = j + 1 + i * (split(3) + 1);
                    face{k}.make(num,4) = face{k}.make(num,3) - 1;
                    
                    
                    face{k}.Ca(num) = Ca(1);
                    face{k}.Cd(num) = Ca(2);
                    face{k}.Cs(num) = Ca(3);
                    face{k}.Ct(num) = Ca(4);
                end
            end
            
        case 4%: // Y-面
            for i=1:split(1)
                for j=1:split(3)
                    
                    num = j + (i - 1) * split(3);
                    
                    face{k}.make(num,1) = j + (i - 1) * (split(3) + 1);
                    face{k}.make(num,2) = j + i * (split(3) + 1);
                    face{k}.make(num,3) = face{k}.make(num,2) + 1;
                    face{k}.make(num,4) = face{k}.make(num,1) + 1;
                    
                    
                    face{k}.Ca(num) = Ca(1);
                    face{k}.Cd(num) = Ca(2);
                    face{k}.Cs(num) = Ca(3);
                    face{k}.Ct(num) = Ca(4);
                end
            end
            
        case 5%: // Z+面
            for i=1:split(2)
                for j=1:split(1)
                    
                    num = j + (i - 1) * split(1);
                    
                    face{k}.make(num,1) = j + (i - 1) * (split(1) + 1);
                    face{k}.make(num,2) = face{k}.make(num,1) + 1;
                    face{k}.make(num,3) = j + 1 + i * (split(1) + 1);
                    face{k}.make(num,4) = face{k}.make(num,3) - 1;
                    
                    
                    face{k}.Ca(num) = Ca(1);
                    face{k}.Cd(num) = Ca(2);
                    face{k}.Cs(num) = Ca(3);
                    face{k}.Ct(num) = Ca(4);
                end
            end
        case 6%: // Z-面
            for i=1:split(2)
                for j=1:split(1)
                    
                    num = j + (i - 1) * split(1);
                    
                    face{k}.make(num,1) = j + (i - 1) * (split(1) + 1);
                    face{k}.make(num,2) = j + i * (split(1) + 1);
                    face{k}.make(num,3) = face{k}.make(num,2) + 1;
                    face{k}.make(num,4) = face{k}.make(num,1) + 1;
                    
                    face{k}.Ca(num) = Ca(1);
                    face{k}.Cd(num) = Ca(2);
                    face{k}.Cs(num) = Ca(3);
                    face{k}.Ct(num) = Ca(4);
                end
            end
    end
end
