function tle = readTLE(TLEname)
% ----------------------------------------------------------------------
%    read TLE(Two-Line-Elements) files 
%    20190201  y.yoshimura
%    Inputs: %   Orbital elements :
%      a [km]   : semi-major axis
%      e         : eccentricity
%      i [rad] : inclination
%      W [rad] : longitude of the ascending node
%      w [rad] : argument of perigee
%      M [rad] : mean anomaly at EPOCH
%      P [s]    : Revolution Number at Epoch
%   Outputs:
%   related function files:
%   note: いまのところsatellite nameのないTLEしか対応していない
%         TLEが複数並んでいるのは可能
%   cf:
%   revisions;
%
%   (c) 2019 yasuhiro yoshimura
%----------------------------------------------------------------------

orbit_const   %GE, in km^3/day^2

%% scan TLE file

data = importdata(TLEname, '');
n = length(data); % the number of data
line1 = cell2mat(data(1:2:n));
line2 = cell2mat(data(2:2:n));
%% Information from LINE1
satid = line1(:,3:7);
launchYear = str2num(line1(:,10:11));
launchNum = str2num(line1(:,12:14));
launchPiece = str2num(line1(:,15:17));

year = line1(:,19:20);
epochDayOfYear = str2num(line1(:,21:32));
tmp = (year(:,1)>'4') .* '19'...
    + (year(:,1)<='4') .* '20';
syear = strcat(tmp, year); % 4-digit year
epochYear = str2num(syear);

ep = datevec(datenum(epochYear, zeros(n/2,1), epochDayOfYear));
jd = gc2jd(ep(:,1),ep(:,2),ep(:,3),ep(:,4),ep(:,5),ep(:,6));

%% Information from LINE2
rpd = str2num(line2(:,53:63));           % rounds per day

oe = [(GE_day .* (1 ./ rpd ./ 2 ./pi).^2).^(1/3) ...  % semimajor axis
    str2num(strcat(ones(n/2,1).*'0.', line2(:,27:33)))...      % eccentricity
    str2num(line2(:,9:16)) ...            % [deg] inclination
    str2num(line2(:,18:25))...         % [deg] longitude (or right ascension) of the ascending node
    str2num(line2(:,35:42)) ...            % [deg] argument of periapsis (or perigee)
    str2num(line2(:,44:51))];          % [deg] mean anomaly at epoch

oe(:,3:6) = deg2rad(oe(:,3:6)); % nx6 matrix

% TLE structure
tle.satID = satid;
tle.launchYear = launchYear;
tle.launchNum = launchNum;
tle.launchPiece = launchPiece;
tle.oe = oe;
tle.jd = jd;