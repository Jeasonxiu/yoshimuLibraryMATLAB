function rb = qRotation(scalar, r, qIn)
% -------------------------------------------------------------------------------------
%   vector rotation by quaternions
%   function rb = qRotation(scalar, r, qIn)
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           r, vector, nx3 vector
%           q, quaternions, nx4 vector
%   Output: q \otimes r \otimes q^(-1)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------

% q \otimes p = [ q4 .* pv + p4 .* qv - cross(qv,pv)
%                 q4 * p4 - qv' * pv]

% quaternion multipliation�Ōv�Z����̂ŕ֋X��Cnx4 vector�ɂ���
r_temp = [zeros(length(r),1) r];

% q0���X�J���[�̒�`���� \odot �̃N�H�[�^�j�I���ς̒�`�Ōv�Z����
    q = (scalar == 0) .* qIn ...
        + (scalar == 4) .* [qIn(:,4), qIn(:,1), qIn(:,2), qIn(:,3)];
    
    q_inv = qInv(0, q);  
    
    temp  = qMult(0, 0, q_inv, r_temp);
    temp2 = qMult(0, 0, temp, q);
    
    rb = temp2(:,2:4);
    
end