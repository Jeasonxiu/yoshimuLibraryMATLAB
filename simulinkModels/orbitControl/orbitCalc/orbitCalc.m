% -------------------------------------------------------------------------------------
%   orbit calculation
%   11�� 10, 2015 yasuhiro yoshimura
%    Input:
%   Output:
%   related function files:
%-------------------------------------------------------------------------------------

clc
clear all
close all

AU = 1.496e+8; % �n���Ƒ��z�̋��� km
re = 6378;     % km, �n�����a
r_m = 1738.4;  % km, ���̔��a
r_em = 384400; % ���ƒn���̋���, km

mu   = 3.986 * 10^5;             % �n�S�d�͒萔 [km^3/s^2]
mu_m = 4.902793 *  10^3;         % ���̏d�͒萔 [km^3/s^2]
mu_s = 1.327 * 10^11;             % ���z�̏d�͒萔 [km^3/s^2]
v_m  = 360 / 27.3 / 24 / 60 / 60; %���̎��]���x [deg/s]
v_m  = v_m * 180.0 / pi; % rad/s

alt = 200; % km ���x

v1 = sqrt(mu / (re + alt)) % �n������O�� [km/s]

% �����猎�̎���O���i������100km�j��
alt_m = 100;
a1 = (r_m + r_m+alt_m) / 2;
dV0 = sqrt(mu_m * (2 / r_m - 1 / a1)) % ���̎��]���x�͏������̂Ŗ���

% Encke�a���̋O���v�f
perihelion  = 0.339269 * AU % km; �ߓ��_
e_enc = 0.847040;           % ���S��
aperihelion = (1 + e_enc) / (1 - e_enc) * perihelion % �����_, km
a_enc = (perihelion + aperihelion) / 2;     % �O�������a
n = sqrt(mu_s / a_enc^3)                    % mean motion, rad/s
va = sqrt((1+e_enc)/(1-e_enc)) * a_enc * n  % �ߓ��_�ł̑��x


