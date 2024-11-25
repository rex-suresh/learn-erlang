-module(cars).
-export([getPrice/2]).

% Cars = ["BMW", "Lambo", "Merc"].


% 1usd = 90inr
% 1eur = 1.2usd

% % V1
% convert({Amount, usd}, inr) -> 
%     Amount * 90;
% convert({Amount, usd}, eur) -> 
%     Amount / 1.2;
% convert({Amount, usd}, usd) -> 
%     Amount;
% convert({Amount, eur}, inr) -> 
%     convert({convert({Amount, eur}, usd), usd}, inr);
% convert({Amount, eur}, usd) -> 
%     Amount * 1.2;
% convert({Amount, eur}, eur) -> 
%     Amount;
% convert({Amount, inr}, usd) -> 
%     Amount / 90;
% convert({Amount, inr}, eur) -> 
%     convert({convert({Amount, inr}, usd), usd }, eur);
% convert({Amount, inr}, inr) -> 
%     Amount.

% V2
convert({Amount, From}, To) -> 
    case {From, To} of
        {usd, inr} -> Amount * 90;
        {inr, usd} -> Amount / 90;
        {eur, usd} -> Amount * 1.2;
        {usd, eur} -> Amount / 1.2;
        {eur, inr} -> convert({convert({Amount, eur}, usd), usd}, inr);
        {inr, eur} -> convert({convert({Amount, inr}, usd), usd}, eur);
        {From, To} -> Amount
    end.


getPrice(Car, To) -> 
    Prices = #{"BMW" => 15000, "Lambo" => 50000, "Merc" => 70000},
    PriceUSD = maps:get(Car, Prices),
    convert({PriceUSD, usd}, To).
