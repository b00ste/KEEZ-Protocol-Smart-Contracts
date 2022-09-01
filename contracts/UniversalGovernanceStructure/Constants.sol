// SPDX-License-Identifier: CC0-1.0
pragma solidity 0.8.10;

// --- ERC165 interface ids
bytes4 constant _INTERFACEID_LSP6 = 0xc403d48f;

// --- DEFAULT PERMISSIONS VALUES
bytes32 constant _PERMISSION_VOTE = 0x0000000000000000000000000000000000000000000000000000000000000001;
bytes32 constant _PERMISSION_PROPOSE = 0x0000000000000000000000000000000000000000000000000000000000000002;
bytes32 constant _PERMISSION_EXECUTE = 0x0000000000000000000000000000000000000000000000000000000000000004;
bytes32 constant _PERMISSION_SEND_DELEGATE = 0x0000000000000000000000000000000000000000000000000000000000000008;
bytes32 constant _PERMISSION_RECIEVE_DELEGATE = 0x0000000000000000000000000000000000000000000000000000000000000010;
bytes32 constant _PERMISSION_ADD_PERMISSIONS = 0x0000000000000000000000000000000000000000000000000000000000000020;
bytes32 constant _PERMISSION_REMOVE_PERMISSIONS = 0x0000000000000000000000000000000000000000000000000000000000000040;
bytes32 constant _PERMISSION_REGISTER_VOTES = 0x0000000000000000000000000000000000000000000000000000000000000080;

// --- PARTICIPANTS KEYS

/**
 * This is how one would generate the key for the
 * array of participants for a Universal Governance Structure
 *
 * keccak256(
 *   abi.encode(
 *     keccak256("UniversalGovernanceStructure"),
 *     keccak256("ParticipantsArray[]"),
 *     UniversalGovernanceStructureAddress
 *   )
 * )
 *
 * From this one could derive:
 * _UGS_PARTICIPANTS_ARRAY_PREFIX = bytes16(_UGS_PARTICIPANTS_ARRAY_KEY(_USGAddress))
 * _UGS_PARTICIPANTS_MAPPING_PREFIX = bytes10(_UGS_PARTICIPANTS_ARRAY_KEY(_USGAddress))
 */
function _UGS_PARTICIPANTS_ARRAY_KEY(address _UGSAddress)
    pure
    returns (bytes32 _UGSKey)
{
    _UGSKey = keccak256(
        abi.encode(
            keccak256("UniversalGovernanceStructure"),
            keccak256("ParticipantsArray[]"),
            _UGSAddress
        )
    );
}

function _UGS_PARTICIPANTS_ARRAY_PREFIX(bytes32 key)
    pure
    returns (bytes16 arrayPrefix)
{
    arrayPrefix = bytes16(key);
}

function _UGS_PARTICIPANTS_MAPPING_PREFIX(bytes32 key)
    pure
    returns (bytes10 mappingPrefix)
{
    mappingPrefix = bytes10(key);
}

// --- DAO DELEGATING KEYS


/**
 * This is how one would generate the mapping for a key that gets
 * the delegatee of an address for a Universal Governance Structure
 *
 * keccak256(
 *   abi.encode(
 *     keccak256("UniversalGovernanceStructure"),
 *     keccak256("Delegatee"),
 *     UniversalGovernanceStructureAddress
 *   )
 * )
 */
function _DAO_DELEGATEE_PREFIX(address _UGSAddress)
    pure
    returns (bytes10 _UGSKey)
{
    _UGSKey = bytes10(
        keccak256(
            abi.encode(
                keccak256("UniversalGovernanceStructure"),
                keccak256("Delegtatee"),
                _UGSAddress
            )
        )
    );
}

/**
 * This is how one would generate the mapping for a key that gets
 * the address of delegates of an address for for a Universal Governance Structure
 *
 * keccak256(
 *   abi.encode(
 *     keccak256("UniversalGovernanceStructure"),
 *     keccak256("AddressDelegates"),
 *     UniversalGovernanceStructureAddress
 *   )
 * )
 */
function _DAO_DELEGATES_ARRAY_PREFIX(address _UGSAddress)
    pure
    returns (bytes10 _UGSKey)
{
    _UGSKey = bytes10(
        keccak256(
            abi.encode(
                keccak256("UniversalGovernanceStructure"),
                keccak256("AddressDelegates"),
                _UGSAddress
            )
        )
    );
}

// --- UNIVERSAL GOVERNANCE STRUCTURE SETTINGS

/**
 * This is how one would get Majority Key for a Universal Governance Structure
 *
 * bytes32(
 *   bytes.concat(
 *     keccak256("Majority"),
 *     bytes2(0),
 *     bytes20(_UGSAddress)
 *   )
 * )
 */
function _USG_MAJORITY_KEY(address _UGSAddress)
    pure
    returns (bytes32 _USGMajority)
{
    _USGMajority = bytes32(
        bytes.concat(
            bytes10(keccak256("Majority")),
            bytes2(0),
            bytes20(_UGSAddress)
        )
    );
}

/**
 * This is how one would get Participation Rate Key for a Universal Governance Structure
 *
 * bytes32(
 *   bytes.concat(
 *     keccak256("ParticipationRate"),
 *     bytes2(0),
 *     bytes20(_UGSAddress)
 *   )
 * )
 */
function _USG_PARTICIPATION_RATE_KEY(address _UGSAddress)
    pure
    returns (bytes32 _USGMajority)
{
    _USGMajority = bytes32(
        bytes.concat(
            bytes10(keccak256("ParticipationRate")),
            bytes2(0),
            bytes20(_UGSAddress)
        )
    );
}

/**
 * This is how one would get Minimum Voting Delay Key for a Universal Governance Structure
 *
 * bytes32(
 *   bytes.concat(
 *     keccak256("MinimumVotingDelay"),
 *     bytes2(0),
 *     bytes20(_UGSAddress)
 *   )
 * )
 */
function _USG_MINIMUM_VOTING_DELAY_KEY(address _UGSAddress)
    pure
    returns (bytes32 _USGMajority)
{
    _USGMajority = bytes32(
        bytes.concat(
            bytes10(keccak256("MinimumVotingDelay")),
            bytes2(0),
            bytes20(_UGSAddress)
        )
    );
}

/**
 * This is how one would get Minimum Voting Period Key for a Universal Governance Structure
 *
 * bytes32(
 *   bytes.concat(
 *     keccak256("MinimumVotingPeriod"),
 *     bytes2(0),
 *     bytes20(_UGSAddress)
 *   )
 * )
 */
function _USG_MINIMUM_VOTING_PERIOD_KEY(address _UGSAddress)
    pure
    returns (bytes32 _USGMajority)
{
    _USGMajority = bytes32(
        bytes.concat(
            bytes10(keccak256("MinimumVotingPeriod")),
            bytes2(0),
            bytes20(_UGSAddress)
        )
    );
}

/**
 * This is how one would get Minimum Registering Votes Period for a Universal Governance Structure
 *
 * bytes32(
 *   bytes.concat(
 *     keccak256("MinimumRegisteringVotesPeriod"),
 *     bytes2(0),
 *     bytes20(_UGSAddress)
 *   )
 * )
 */
function _USG_MINIMUM_REGISTERING_VOTES_PERIOD_KEY(address _UGSAddress)
    pure
    returns (bytes32 _USGMajority)
{
    _USGMajority = bytes32(
        bytes.concat(
            bytes10(keccak256("MinimumRegisteringVotesPeriod")),
            bytes2(0),
            bytes20(_UGSAddress)
        )
    );
}

/**
 * This is how one would get Minimum Execution Delay for a Universal Governance Structure
 *
 * bytes32(
 *   bytes.concat(
 *     keccak256("MinimumExecutionDelay"),
 *     bytes2(0),
 *     bytes20(_UGSAddress)
 *   )
 * )
 */
function _USG_MINIMUM_EXECUTION_DELAY_KEY(address _UGSAddress)
    pure
    returns (bytes32 _USGMajority)
{
    _USGMajority = bytes32(
        bytes.concat(
            bytes10(keccak256("MinimumExecutionDelay")),
            bytes2(0),
            bytes20(_UGSAddress)
        )
    );
}
