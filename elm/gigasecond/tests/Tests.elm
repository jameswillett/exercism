module Tests exposing (tests)

import Expect
import Gigasecond exposing (add)
import Test exposing (..)
import Time
import Date exposing (Date)
import Date.Extra.Format exposing (utcIsoString)
--import Date.Format as Format exposing (utcIsoString)
tests : Test
tests =
    describe "Gigasecond"
        [ describe "add"
            [ test "2011-04-25" <|
                \() ->
                    Expect.equal "2043-01-01T01:46:40.000Z"
                        (gigasecond "2011-04-25")
            ,
                test "1977-06-13" <|
                    \() ->
                        Expect.equal "2009-02-19T01:46:40.000Z"
                            (gigasecond "1977-06-13")
            ,
                test "1959-07-19" <|
                    \() ->
                        Expect.equal "1991-03-27T01:46:40.000Z"
                            (gigasecond "1959-07-19")
            ,
                test "full time specified" <|
                    \() ->
                        Expect.equal "2046-10-02T23:46:40.000Z"
                            (gigasecond "2015-01-24T22:00:00.000Z")
            ,
                test "full time with day roll-over" <|
                    \() ->
                        Expect.equal "2046-10-03T01:46:39.000Z"
                            (gigasecond "2015-01-24T23:59:59.000Z")
            ]
        ]


gigasecond : String -> String
gigasecond date =
    case Date.fromString date of
        Ok posix ->
            posix
                |> add
                |> utcIsoString

        _ ->
            ""
