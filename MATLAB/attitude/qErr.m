function qe = qErr(scalar, q, qd)
% -------------------------------------------------------------------------------------
%  calculate quaternion error
%  qを回転させてqdに一致させるためのerror quaternions, qe
%    Input: scalar, specifies the definition of the quaternion
%           scalar == 0,  q0:= cos(theta/2), q = [q0, q1, q2, q3]
%           scalar == 4,  q4:= cos(theta/2), q = [q1, q2, q3, q4]
%           q, current (or true ) quaternion, Nx4 matrix
%           qd, desired (or estimated ) quaternion, Nx4 matrix
%   Output: qd^(-1) \odot  q Nx4 matrix
%   qErr(scalar, q, qd)
%   (c) 2015 yasuhiro yoshimura
%-------------------------------------------------------------------------------------

% q \otimes p = [ q0 * p0 - qv' * pv
%               q0 .* pv + p0 .* qv - cross(qv,pv)]


% q0がスカラーの定義かつ \odot のクォータニオン積の定義で計算する
    qtemp = (scalar == 0) .* q ...
        + (scalar == 4) .* [q(:,4), q(:,1), q(:,2), q(:,3)];
    qtemp_d = (scalar == 0) .* qd ...
        + (scalar == 4) .* [qd(:,4), qd(:,1), qd(:,2), qd(:,3)];
    
    q_inv_d = qInv(0, qtemp_d);  
    
    temp = qMult(0, 0, q_inv_d, qtemp);
   
    qe = (scalar == 0) .* temp ...
        + (scalar == 4) .* [temp(:,2), temp(:,3), temp(:,4), temp(:,1)];
    
end